import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerCropsDB {
  final tableName = 'tblfrfarmercrops';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "crop_id" INTEGER NOT NULL,
        "crop_code" VARCHAR(25) NOT NULL,
        "crop_area" DOUBLE NOT NULL,
        "area_unit_id" INTEGER NOT NULL,
        "crop_motive_id" INTEGER NOT NULL,
        "water_source_id" INTEGER NOT NULL,
        "usage_of_certified_seeds" BOOLEAN,
        "crop_system_id" INTEGER NOT NULL,
        "fertilizer_use" BOOLEAN,
        "pesticide_use" BOOLEAN,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_crop_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int cropId,
    required String cropCode,
    required double cropArea,
    required int areaUnitId,
    required int cropMotiveId,
    required int waterSourceId,
    bool? usageOfCertifiedSeeds,
    required int cropSystemId,
    bool? fertilizerUse,
    bool? pesticideUse,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, crop_id, crop_code, crop_area, area_unit_id, crop_motive_id, water_source_id,
        usage_of_certified_seeds, crop_system_id, fertilizer_use, pesticide_use, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      cropId,
      cropCode,
      cropArea,
      areaUnitId,
      cropMotiveId,
      waterSourceId,
      usageOfCertifiedSeeds == true ? 1 : 0,
      cropSystemId,
      fertilizerUse == true ? 1 : 0,
      pesticideUse == true ? 1 : 0,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFarmerCrops(List<FarmerCrop> farmerCrops) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var farmerCrop in farmerCrops) {
        batch.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, crop_id, crop_code, crop_area, area_unit_id, crop_motive_id, water_source_id,
        usage_of_certified_seeds, crop_system_id, fertilizer_use, pesticide_use, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
          farmerCrop.farmerId,
          farmerCrop.farmerFarmId,
          farmerCrop.cropId,
          farmerCrop.cropCode,
          farmerCrop.cropArea,
          farmerCrop.areaUnitId,
          farmerCrop.cropMotiveId,
          farmerCrop.waterSourceId,
          farmerCrop.usageOfCertifiedSeeds == true ? 1 : 0,
          farmerCrop.cropSystemId,
          farmerCrop.fertilizerUse == true ? 1 : 0,
          farmerCrop.pesticideUse == true ? 1 : 0,
          farmerCrop.dateCreated.toLocal().toIso8601String(),
          farmerCrop.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerCrop>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerCrops = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerCrops.map((e) => FarmerCrop.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerCrop> fetchByFarmerCropId(int farmerCropId) async {
    final database = await DatabaseService().database;
    final farmerCrop = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_crop_id = ?
    ''', [farmerCropId]);

    return FarmerCrop.fromSqfliteDatabase(farmerCrop.first);
  }

  // Add more database methods as needed
}
