import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/type.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationTypeDB {
  final tableName = 'tblfrfarmersirrigationtypes';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,        
        "farmer_farm_id" INTEGER NOT NULL,
        "irrigation_type_id" INTEGER NOT NULL,
        "others_name" VARCHAR(255),
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        "active" INT,
        "enumerator_id" INT,
        "other" VARCHAR(100),
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create(FarmerIrrigationType irrigationType) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, irrigation_type_id, others_name, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      irrigationType.farmerId,
      irrigationType.farmerFarmId,
      irrigationType.irrigationTypeId,
      irrigationType.othersName,
      DateTime.now().toLocal().toIso8601String(),
      irrigationType.createdBy,
    ]);
  }

  Future<int> update(FarmerIrrigationType irrigationType) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        irrigation_type_id = ?, others_name = ? 
      WHERE irrigation_crop_id = ?
    ''', [
      irrigationType.irrigationTypeId,
      irrigationType.othersName,
      irrigationType.irrigationCropId,
    ]);
  }

  Future<int> insertIrrigationTypes(
      List<FarmerIrrigationType> irrigationTypes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationType in irrigationTypes) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, irrigation_type_id, others_name, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigationType.farmerId,
          irrigationType.farmerFarmId,
          irrigationType.irrigationTypeId,
          irrigationType.othersName,
          DateTime.now().toLocal().toIso8601String(),
          irrigationType.createdBy,
          0,
          irrigationType.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertIrrigationTypes(
      List<FarmerIrrigationType> irrigationTypes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationType in irrigationTypes) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, others_name = ?, date_created = ? WHERE farmer_farm_id = ? AND irrigation_type_id = ?
        ''', [
          irrigationType.othersName,
          irrigationType.dateCreated?.toLocal().toIso8601String(),
          irrigationType.farmerFarmId,
          irrigationType.irrigationTypeId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationType>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final irrigationTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return irrigationTypes
        .map((e) => FarmerIrrigationType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerIrrigationType>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerIrrigationType.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<List<FarmerIrrigationType>?> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? 
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerIrrigationType.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawDelete('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed       DELETE FROM $tableName WHERE farmer_farm_id = ?
}
