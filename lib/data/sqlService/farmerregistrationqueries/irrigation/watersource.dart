import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationWaterSourceDB {
  final tableName = 'tblfrfarmersirrigationwatersources';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,        
        "farmer_farm_id" INTEGER NOT NULL,
        "irrigation_water_source_id" INTEGER NOT NULL,
        "source_name" VARCHAR(255) NOT NULL,
        "date_created" DATETIME ,
        "created_by" VARCHAR(255) ,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create(FarmerIrrigationWaterSource irrigationWaterSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, irrigation_water_source_id, source_name, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      irrigationWaterSource.farmerId,
      irrigationWaterSource.farmerFarmId,
      irrigationWaterSource.irrigationWaterSourceId,
      irrigationWaterSource.sourceName,
      DateTime.now().toLocal().toIso8601String(),
      irrigationWaterSource.createdBy,
    ]);
  }

  Future<int> update(FarmerIrrigationWaterSource irrigationWaterSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        irrigation_water_source_id = ?, source_name = ? 
      WHERE irrigation_crop_id = ?
    ''', [
      irrigationWaterSource.irrigationWaterSourceId,
      irrigationWaterSource.sourceName,
      irrigationWaterSource.irrigationWaterSourceId,
    ]);
  }

  Future<int> insertIrrigationWaterSources(
      List<FarmerIrrigationWaterSource> irrigationWaterSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationWaterSource in irrigationWaterSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, irrigation_water_source_id, source_name, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigationWaterSource.farmerId,
          irrigationWaterSource.farmerFarmId,
          irrigationWaterSource.irrigationWaterSourceId,
          irrigationWaterSource.sourceName,
          DateTime.now().toLocal().toIso8601String(),
          irrigationWaterSource.createdBy,
          0,
          irrigationWaterSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertIrrigationWaterSources(
      List<FarmerIrrigationWaterSource> irrigationWaterSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationWaterSource in irrigationWaterSources) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, source_name = ?, date_created = ? WHERE farmer_farm_id = ? AND irrigation_water_source_id = ?
        ''', [
          irrigationWaterSource.sourceName,
          irrigationWaterSource.dateCreated.toLocal().toIso8601String(),
          irrigationWaterSource.farmerFarmId,
          irrigationWaterSource.irrigationWaterSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationWaterSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final irrigationWaterSources = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return irrigationWaterSources
        .map((e) => FarmerIrrigationWaterSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerIrrigationWaterSource>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerIrrigationWaterSource.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<List<FarmerIrrigationWaterSource>?> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerIrrigationWaterSource.fromSqfliteDatabase(e))
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
