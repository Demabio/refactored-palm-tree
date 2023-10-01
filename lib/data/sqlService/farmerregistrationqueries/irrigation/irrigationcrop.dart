import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/irrigationcrop.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationCropDB {
  final tableName = 'tblfrfarmersirrigationcrops';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "crop_id" INTEGER NOT NULL,
        "area_of_crop" REAL NOT NULL,
        "area_unit_id" INTEGER NOT NULL,
        "no_of_crop_per_year" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int cropId,
    required double areaOfCrop,
    required int areaUnitId,
    required int noOfCropPerYear,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, crop_id, area_of_crop, area_unit_id, no_of_crop_per_year, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      cropId,
      areaOfCrop,
      areaUnitId,
      noOfCropPerYear,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationCrops(
      List<FarmerIrrigationCrop> irrigationCrops) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationCrop in irrigationCrops) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, crop_id, area_of_crop, area_unit_id, no_of_crop_per_year, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigationCrop.farmerId,
          irrigationCrop.cropId,
          irrigationCrop.areaOfCrop,
          irrigationCrop.areaUnitId,
          irrigationCrop.noOfCropPerYear,
          irrigationCrop.dateCreated.toLocal().toIso8601String(),
          irrigationCrop.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationCrop>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationCrops = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationCrops
        .map((e) => FarmerIrrigationCrop.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
