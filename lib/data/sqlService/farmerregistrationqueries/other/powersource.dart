import 'package:kiamis_app/data/models/farmerregistrationmodels/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farm_power_source_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int powerSourceId,
    String? othersName,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, power_source_id, others_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      powerSourceId,
      othersName,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertPowerSources(List<FarmerPowerSource> powerSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var powerSource in powerSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, power_source_id, others_name, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          powerSource.farmerId,
          powerSource.farmerFarmId,
          powerSource.powerSourceId,
          powerSource.othersName,
          powerSource.dateCreated.toLocal().toIso8601String(),
          powerSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerPowerSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final powerSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return powerSources
        .map((e) => FarmerPowerSource.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
