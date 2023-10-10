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
        "crop_code" VARCHAR(25),
        "crop_area" DOUBLE,
        "area_unit_id" INTEGER,
        "crop_motive_id" INTEGER ,
        "water_source_id" INTEGER,
        "usage_of_certified_seeds" BOOLEAN,
        "crop_system_id" INTEGER,
        "fertilizer_use" BOOLEAN,
        "pesticide_use" BOOLEAN,
        "date_created" DATETIME,
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

  Future<int> insertNonNullables(FarmerCrop farmerCrop) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, crop_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
        farmerCrop.farmerId,
        farmerCrop.farmerFarmId,
        farmerCrop.cropId,
        DateTime.now().toLocal().toIso8601String(),
        farmerCrop.createdBy,
      ]);
    } catch (e) {
      throw (e);
    }
  }

  Future<int> updatePageOne(FarmerCrop farmerCrop) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
       crop_id = ?, crop_code = ?, crop_area = ?, area_unit_id = ?, usage_of_certified_seeds = ?
      WHERE farmer_crop_id = ?
    ''', [
      farmerCrop.cropId,
      farmerCrop.cropCode.toString(),
      farmerCrop.cropArea,
      farmerCrop.areaUnitId,
      farmerCrop.usageOfCertifiedSeeds! ? 1 : 0,
      farmerCrop.farmerCropId,
    ]);
  }

  Future<int> updatePageTwo(FarmerCrop farmerCrop) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
      crop_motive_id = ?, crop_system_id = ?, water_source_id = ?, pesticide_use = ?, fertilizer_use = ?
      WHERE farmer_crop_id = ?
    ''', [
      farmerCrop.cropMotiveId,
      farmerCrop.cropSystemId,
      farmerCrop.waterSourceId,
      farmerCrop.pesticideUse,
      farmerCrop.fertilizerUse,
      farmerCrop.farmerCropId,
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
          farmerCrop.dateCreated?.toLocal().toIso8601String(),
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

  Future<List<FarmerCrop>> fetchAllByFarmer(int id) async {
    final database = await DatabaseService().database;
    final farmerCrops = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [id]);

    return farmerCrops.map((e) => FarmerCrop.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerCrop?> fetchByFarmerCropId(int farmerCropId) async {
    final database = await DatabaseService().database;
    final farmerCrop = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_crop_id = ?
    ''', [farmerCropId]);

    return farmerCrop.isNotEmpty
        ? FarmerCrop.fromSqfliteDatabase(farmerCrop.first)
        : null;
  }

  // Add more database methods as needed
}
