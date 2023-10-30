import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationCategoryDB {
  final tableName = 'tblfrfarmersirrigationcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "irrigation_category_id" INTEGER NOT NULL,
        "irrigation_project_name" VARCHAR(255) NOT NULL,
        "membership_type_id" INTEGER ,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create(FarmerIrrigationCategory irrigationCategory) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, irrigation_category_id, irrigation_project_name, membership_type_id, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      irrigationCategory.farmerId,
      irrigationCategory.farmerFarmId,
      irrigationCategory.irrigationCategoryId,
      irrigationCategory.irrigationProjectName,
      irrigationCategory.membershipTypeId,
      DateTime.now().toLocal().toIso8601String(),
      irrigationCategory.createdBy,
    ]);
  }

  Future<int> update(FarmerIrrigationCategory irrigationCategory) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        irrigation_category_id = ?, irrigation_project_name = ?, membership_type_id = ? 
      WHERE irrigation_crop_id = ?
    ''', [
      irrigationCategory.irrigationCategoryId,
      irrigationCategory.irrigationProjectName,
      irrigationCategory.membershipTypeId,
    ]);
  }

  Future<int> insertIrrigationCategories(
      List<FarmerIrrigationCategory> irrigationCategories) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationCategory in irrigationCategories) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id,farmer_farm_id, irrigation_category_id, irrigation_project_name, membership_type_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigationCategory.farmerId,
          irrigationCategory.farmerFarmId,
          irrigationCategory.irrigationCategoryId,
          irrigationCategory.irrigationProjectName,
          irrigationCategory.membershipTypeId,
          DateTime.now().toLocal().toIso8601String(),
          irrigationCategory.createdBy,
          1,
          irrigationCategory.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationCategory>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final irrigationCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationCategories
        .map((e) => FarmerIrrigationCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerIrrigationCategory>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerIrrigationCategory.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
