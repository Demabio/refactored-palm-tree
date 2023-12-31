import 'package:kiamis_app/data/models/farmerregistrationmodels/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerPowerSourceDB {
  final tableName = 'tblfrfarmerpowersource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farm_power_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "power_source_id" INTEGER NOT NULL,
        "others_name" VARCHAR(255),
        "date_created" DATETIME,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farm_power_source_id")
      );
    """);
  }

  Future<int> create(FarmerPowerSource farmerPowerSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, power_source_id, others_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerPowerSource.farmerId,
      farmerPowerSource.farmerFarmId,
      farmerPowerSource.powerSourceId,
      farmerPowerSource.othersName,
      DateTime.now().toLocal().toIso8601String(),
      farmerPowerSource.createdBy,
    ]);
  }

  Future<int> insertPowerSources(List<FarmerPowerSource> powerSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var powerSource in powerSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, power_source_id, others_name, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          powerSource.farmerId,
          powerSource.farmerFarmId,
          powerSource.powerSourceId,
          powerSource.othersName,
          DateTime.now().toLocal().toIso8601String(),
          powerSource.createdBy,
          0,
          powerSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertPowerSources(List<FarmerPowerSource> powerSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var powerSource in powerSources) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, others_name = ?, date_created = ? WHERE farmer_farm_id = ? AND power_source_id = ?
        ''', [
          powerSource.othersName,
          powerSource.dateCreated?.toLocal().toIso8601String(),
          powerSource.farmerFarmId,
          powerSource.powerSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> update(FarmerPowerSource farmerPowerSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        power_source_id = ?
      WHERE farm_power_source_id = ?
    ''', [
      farmerPowerSource.powerSourceId,
      farmerPowerSource.farmPowerSourceId,
    ]);
  }

  Future<List<FarmerPowerSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final powerSources = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return powerSources
        .map((e) => FarmerPowerSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerPowerSource>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories
            .map((e) => FarmerPowerSource.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<List<FarmerPowerSource>?> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories
            .map((e) => FarmerPowerSource.fromSqfliteDatabase(e))
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
