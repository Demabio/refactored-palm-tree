import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockfarmcategory.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class LivestockFarmSystemCategoryDB {
  final tableName = 'tblfrlivestockfarmsystemcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_farmsystem_cat_id" INTEGER NOT NULL,
        "livestock_cat_id" INTEGER NOT NULL,
        "livestock_farmsystem_id" INTEGER NOT NULL,
        "livestock_farmsys_cat_code" VARCHAR(25) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livestock_farmsystem_cat_id")
      );
    """);
  }

  Future<int> create({
    required int livestockCatId,
    required int livestockFarmSystemId,
    required String livestockFarmSystemCatCode,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        livestock_cat_id, livestock_farmsystem_id, livestock_farmsys_cat_code,
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      livestockCatId,
      livestockFarmSystemId,
      livestockFarmSystemCatCode,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertCategories(
      List<LivestockFarmSystemCategory> categories) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var category in categories) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            livestock_cat_id, livestock_farmsystem_id, livestock_farmsys_cat_code,
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          category.livestockCatId,
          category.livestockFarmsystemId,
          category.livestockFarmsysCatCode,
          category.dateCreated.toLocal().toIso8601String(),
          category.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<LivestockFarmSystemCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories
        .map((e) => LivestockFarmSystemCategory.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
