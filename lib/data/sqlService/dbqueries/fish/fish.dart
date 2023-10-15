import 'package:kiamis_app/data/models/dbModels/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FishTypeDB {
  final tableName = 'tblfrfishtype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fish_type_id" INTEGER NOT NULL,
        "fish_category_id" INTEGER NOT NULL,
        "fish_type" VARCHAR(255) NOT NULL,
        "fish_code" VARCHAR(25),
        "common_fish" BOOLEAN,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("fish_type_id")
      );
    """);
  }

  Future<int> create({
    required int fishCategoryId,
    required String fishType,
    String? fishCode,
    required bool commonFish,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (fish_category_id, fish_type, fish_code, common_fish, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      fishCategoryId,
      fishType,
      fishCode,
      commonFish ? 1 : 0,
      description,
      DateTime.now().toLocal().toIso8601String(), // Use current datetime
      createdBy,
    ]);
  }

  Future<int> insertFishTypes(List<FishType> fishTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishType in fishTypes) {
        batch.rawInsert('''
      INSERT INTO $tableName (fish_type_id,fish_category_id, fish_type, fish_code, common_fish, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
          fishType.fishTypeId,
          fishType.fishCategoryId,
          fishType.fishType,
          fishType.fishCode,
          fishType.commonFish! ? 1 : 0,
          fishType.description,
          fishType.dateCreated.toLocal().toIso8601String(),
          fishType.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishType>> fetchAll() async {
    final database = await DatabaseService().database;
    final fishTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fishTypes.map((e) => FishType.fromSqfliteDatabase(e)).toList();
  }

  Future<List<FishType>> fetchAllJoined() async {
    final database = await DatabaseService().database;
    final fishTypes = await database.rawQuery(''' 
      SELECT tblfrfishtype.*,tblfrfishcategories.fish_category FROM $tableName 
      LEFT JOIN tblfrfishcategories ON tblfrfishtype.fish_category_id = tblfrfishcategories.fish_category_id
    ''');

    return fishTypes.map((e) => FishType.fromSqfliteDatabaseJoined(e)).toList();
  }

  Future<List<FishType>> fetchCommonFish() async {
    final database = await DatabaseService().database;
    final fishTypes = await database.rawQuery(''' 
      SELECT tblfrfishtype.*,tblfrfishcategories.fish_category FROM $tableName 
      LEFT JOIN tblfrfishcategories ON tblfrfishtype.fish_category_id = tblfrfishcategories.fish_category_id 
      WHERE $tableName.common_fish = 1
    ''');

    return fishTypes.map((e) => FishType.fromSqfliteDatabaseJoined(e)).toList();
  }

  Future<List<FishType>> fetchByCategoryId(int id) async {
    final database = await DatabaseService().database;
    final fishTypes = await database.rawQuery(''' 
      SELECT tblfrfishtype.*,tblfrfishcategories.fish_category FROM $tableName 
      LEFT JOIN tblfrfishcategories ON tblfrfishtype.fish_category_id = tblfrfishcategories.fish_category_id 
      WHERE $tableName.fish_category_id = ?
    ''', [id]);

    return fishTypes.map((e) => FishType.fromSqfliteDatabaseJoined(e)).toList();
  }

  Future<List<FishType>> searchFish(String fish) async {
    final database = await DatabaseService().database;
    final fishTypes = await database.rawQuery(''' 
      SELECT tblfrfishtype.*,tblfrfishcategories.fish_category FROM $tableName 
      LEFT JOIN tblfrfishcategories ON tblfrfishtype.fish_category_id = tblfrfishcategories.fish_category_id 
      WHERE $tableName.fish_type LIKE '%' || ? || '%' LIMIT 5
    ''', [fish]);

    return fishTypes.map((e) => FishType.fromSqfliteDatabaseJoined(e)).toList();
  }

  Future<FishType?> fetchByFishTypeId(int fishTypeId) async {
    final database = await DatabaseService().database;
    final fishType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fish_type_id = ?
    ''', [fishTypeId]);

    return fishType.isNotEmpty
        ? FishType.fromSqfliteDatabase(fishType.first)
        : null;
  }

  // Add more database methods as needed
}
