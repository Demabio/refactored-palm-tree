import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/irrigation.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationDB {
  final tableName = 'tblfrfarmersirrigation';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_irrigation_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "use_irrigation" BOOLEAN NOT NULL,
        "total_area_irrigation" REAL NOT NULL,
        "area_unit_id" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_irrigation_id")
      );
    """);
  }

  Future<int> create(FarmerIrrigation irrigation) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id,farmer_farm_id ,use_irrigation, total_area_irrigation, area_unit_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      irrigation.farmerId,
      irrigation.farmerFarmId,
      irrigation.useIrrigation,
      irrigation.totalAreaIrrigation,
      irrigation.areaUnitId,
      DateTime.now().toLocal().toIso8601String(),
      irrigation.createdBy,
    ]);
  }

  Future<int> update(FarmerIrrigation irrigation) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        use_irrigation = ?, total_area_irrigation = ?, area_unit_id = ?
      WHERE farmer_irrigation_id = ?
    ''', [
      irrigation.useIrrigation,
      irrigation.totalAreaIrrigation,
      irrigation.areaUnitId,
      irrigation.farmerIrrigationId,
    ]);
  }

  Future<int> insertIrrigation(List<FarmerIrrigation> irrigations) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigation in irrigations) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, use_irrigation, total_area_irrigation, area_unit_id, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigation.farmerId,
          irrigation.farmerFarmId,
          irrigation.useIrrigation,
          irrigation.totalAreaIrrigation,
          irrigation.areaUnitId,
          DateTime.now().toLocal().toIso8601String(),
          irrigation.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigation>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final irrigations = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigations
        .map((e) => FarmerIrrigation.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
