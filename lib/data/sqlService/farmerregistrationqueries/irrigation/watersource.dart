import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationWaterSourceDB {
  final tableName = 'tblfrfarmersirrigationwatersources';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "irrigation_water_source_id" INTEGER NOT NULL,
        "source_name" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int irrigationWaterSourceId,
    required String sourceName,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, irrigation_water_source_id, source_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerId,
      irrigationWaterSourceId,
      sourceName,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationWaterSources(
      List<FarmerIrrigationWaterSource> irrigationWaterSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationWaterSource in irrigationWaterSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, irrigation_water_source_id, source_name, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          irrigationWaterSource.farmerId,
          irrigationWaterSource.irrigationWaterSourceId,
          irrigationWaterSource.sourceName,
          irrigationWaterSource.dateCreated.toLocal().toIso8601String(),
          irrigationWaterSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationWaterSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationWaterSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationWaterSources
        .map((e) => FarmerIrrigationWaterSource.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
