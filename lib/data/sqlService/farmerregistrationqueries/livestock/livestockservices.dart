import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestockservice.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockServicesDB {
  final tableName = 'tblfrfarmerslivestockservices';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestock_services_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "livestock_area" REAL NOT NULL,
        "area_unit_id" INTEGER NOT NULL,
        "fertilizer_for_fodder" BOOLEAN NOT NULL,
        "fodder_seeds" BOOLEAN NOT NULL,
        "fertilizer_seeds" BOOLEAN NOT NULL,
        "ai_use" BOOLEAN NOT NULL,
        "hormone_use" BOOLEAN NOT NULL,
        "embryo_transfer" BOOLEAN NOT NULL,
        "routine_vaccination" BOOLEAN NOT NULL,
        "curative_measures" BOOLEAN NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_livestock_services_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required double livestockArea,
    required int areaUnitId,
    required bool fertilizerForFodder,
    required bool fodderSeeds,
    required bool fertilizerSeeds,
    required bool aiUse,
    required bool hormoneUse,
    required bool embryoTransfer,
    required bool routineVaccination,
    required bool curativeMeasures,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, livestock_area, area_unit_id, 
        fertilizer_for_fodder, fodder_seeds, fertilizer_seeds, ai_use, 
        hormone_use, embryo_transfer, routine_vaccination, curative_measures, 
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      livestockArea,
      areaUnitId,
      fertilizerForFodder ? 1 : 0,
      fodderSeeds ? 1 : 0,
      fertilizerSeeds ? 1 : 0,
      aiUse ? 1 : 0,
      hormoneUse ? 1 : 0,
      embryoTransfer ? 1 : 0,
      routineVaccination ? 1 : 0,
      curativeMeasures ? 1 : 0,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertNonNulls(
      FarmerLivestockService farmerLivestockService) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
       INSERT INTO $tableName (
        farmer_id, farmer_farm_id, livestock_area, area_unit_id, 
        fertilizer_for_fodder, fodder_seeds, fertilizer_seeds, ai_use, 
        hormone_use, embryo_transfer, routine_vaccination, curative_measures, 
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerLivestockService.farmerId,
      farmerLivestockService.farmerFarmId,
      farmerLivestockService.livestockArea,
      farmerLivestockService.areaUnitId,
      farmerLivestockService.fertilizerForFodder,
      farmerLivestockService.fodderSeeds,
      farmerLivestockService.fertilizerSeeds,
      farmerLivestockService.aiUse,
      farmerLivestockService.hormoneUse,
      farmerLivestockService.embryoTransfer,
      farmerLivestockService.routineVaccination,
      farmerLivestockService.curativeMeasures,
      DateTime.now().toLocal().toIso8601String(),
      farmerLivestockService.createdBy,
    ]);
  }

  Future<int> update(FarmerLivestockService farmerLivestockService) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
        UPDATE  $tableName SET
        area_unit_id = ?, fodder_seeds = ?, fertilizer_for_fodder = ?,  ai_use = ?, hormone_use = ?, embryo_transfer = ?, routine_vaccination = ?, curative_measures = ? 
      WHERE farmer_farm_id = ?
    ''', [
      farmerLivestockService.areaUnitId,
      farmerLivestockService.fodderSeeds! ? 1 : 0,
      farmerLivestockService.fertilizerForFodder! ? 1 : 0,
      farmerLivestockService.aiUse!,
      farmerLivestockService.hormoneUse,
      farmerLivestockService.embryoTransfer,
      farmerLivestockService.routineVaccination! ? 1 : 0,
      farmerLivestockService.curativeMeasures! ? 1 : 0,
      farmerLivestockService.farmerFarmId,
    ]);
  }

  Future<int> insertServices(List<FarmerLivestockService> services) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var service in services) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, livestock_area, area_unit_id, 
            fertilizer_for_fodder, fodder_seeds, fertilizer_seeds, ai_use, 
            hormone_use, embryo_transfer, routine_vaccination, curative_measures, 
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          service.farmerId,
          service.farmerFarmId,
          service.livestockArea,
          service.areaUnitId,
          service.fertilizerForFodder! ? 1 : 0,
          service.fodderSeeds! ? 1 : 0,
          service.fertilizerSeeds! ? 1 : 0,
          service.aiUse,
          service.hormoneUse,
          service.embryoTransfer! ? 1 : 0,
          service.routineVaccination! ? 1 : 0,
          service.curativeMeasures! ? 1 : 0,
          DateTime.now().toLocal().toIso8601String(),
          service.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockService>> fetchAll() async {
    final database = await DatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return feeds
        .map((e) => FarmerLivestockService.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerLivestockService?> fetchByFarm(int id) async {
    final database = await DatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? 
    ''', [id]);

    return feeds.isNotEmpty
        ? FarmerLivestockService.fromSqfliteDatabase(feeds.last)
        : null;
  }
}
