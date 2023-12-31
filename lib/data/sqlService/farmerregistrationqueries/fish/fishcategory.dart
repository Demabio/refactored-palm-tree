import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFishCategoryDB {
  final tableName = 'tblfarmerfishcategory';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fishcategory_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "fish_category_id" INTEGER NOT NULL,
        "created_by" INT,
        "date_created" DATETIME,
        "active" INT,
        "enumerator_id" INT,
        "other" VARCHAR(100),
        PRIMARY KEY("farmer_fishcategory_id")
      );
    """);
  }

  Future<int> createFarmerFishCategory(FarmerFishCategory fishCategory) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, fish_category_id, created_by, date_created , active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      fishCategory.farmerId,
      fishCategory.farmerFarmId,
      fishCategory.fishCategoryId,
      fishCategory.createdBy,
      DateTime.now().toLocal().toIso8601String(),
    ]);
  }

  Future<int> update(FarmerFishCategory fishCategory) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        fish_category_id = ? 
      WHERE farmer_fishcategory_id = ?
    ''', [
      fishCategory.fishCategoryId,
      fishCategory.farmerFishCategoryId,
    ]);
  }

  Future<int> insertFishCategories(
      List<FarmerFishCategory> fishCategories) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishCategory in fishCategories) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, fish_category_id, created_by, date_created, active, enumerator_id, other
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          fishCategory.farmerId,
          fishCategory.farmerFarmId,
          fishCategory.fishCategoryId,
          fishCategory.createdBy,
          DateTime.now().toLocal().toIso8601String(),
          0,
          fishCategory.enumeratorId,
          fishCategory.other,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertFishCategories(
      List<FarmerFishCategory> fishCategories) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishCategory in fishCategories) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ?, other = ? WHERE farmer_farm_id = ? AND fish_category_id = ?
        ''', [
          fishCategory.dateCreated?.toLocal().toIso8601String(),
          fishCategory.other,
          fishCategory.farmerFarmId,
          fishCategory.fishCategoryId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> updateall(int farmerCropId, int childid) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 1 WHERE farmer_crop_id = ? AND fertiliser_type_id = ?
    ''', [
      farmerCropId,
      childid,
    ]);
  }

  Future<List<FarmerFishCategory>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return fishCategories
        .map((e) => FarmerFishCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerFishCategory>> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fishCategories
        .map((e) => FarmerFishCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerFishCategory>> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fishCategories
        .map((e) => FarmerFishCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFishCategory> fetchByFarmerFishCategoryId(
      int farmerFishCategoryId) async {
    final database = await FarmerDatabaseService().database;
    final fishCategory = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fishcategory_id = ? AND active = 1
    ''', [farmerFishCategoryId]);

    return FarmerFishCategory.fromSqfliteDatabase(fishCategory.first);
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
