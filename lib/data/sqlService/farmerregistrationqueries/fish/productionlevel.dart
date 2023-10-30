import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionlevel.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFishProductionLevelsDB {
  final tableName = 'tblfrfarmerfishproductionlevels';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_productionlevel_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "production_level_id" INTEGER NOT NULL,
        "fertilizer_in_ponds" BOOLEAN,
        "esp_benefit" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_productionlevel_id")
      );
    """);
  }

  Future<int> create(
      FarmerFishProductionLevel farmerFishProductionLevel) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, production_level_id, fertilizer_in_ponds, esp_benefit, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerFishProductionLevel.farmerId,
      farmerFishProductionLevel.farmerFarmId,
      farmerFishProductionLevel.productionLevelId,
      farmerFishProductionLevel.fertilizerInPonds! ? 1 : 0,
      farmerFishProductionLevel.espBenefit,
      DateTime.now().toLocal().toIso8601String(),
      farmerFishProductionLevel.createdBy,
    ]);
  }

  Future<int> update(
      FarmerFishProductionLevel farmerFishProductionLevel) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        production_level_id = ?, fertilizer_in_ponds = ?, esp_benefit = ?
      WHERE farmer_farm_id = ?
    ''', [
      farmerFishProductionLevel.productionLevelId,
      farmerFishProductionLevel.fertilizerInPonds! ? 1 : 0,
      farmerFishProductionLevel.espBenefit,
      farmerFishProductionLevel.farmerFarmId,
    ]);
  }

  Future<int> insertProductionLevels(
      List<FarmerFishProductionLevel> productionLevels) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var productionLevel in productionLevels) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, production_level_id, fertilizer_in_ponds, esp_benefit, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          productionLevel.farmerId,
          productionLevel.farmerFarmId,
          productionLevel.productionLevelId,
          productionLevel.fertilizerInPonds! ? 1 : 0,
          productionLevel.espBenefit,
          productionLevel.dateCreated?.toLocal().toIso8601String(),
          productionLevel.createdBy,
          1,
          productionLevel.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFishProductionLevel>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final productionLevels = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return productionLevels
        .map((e) => FarmerFishProductionLevel.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFishProductionLevel?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionLevels = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return productionLevels.isNotEmpty
        ? FarmerFishProductionLevel.fromSqfliteDatabase(productionLevels.first)
        : null;
  }

  Future<FarmerFishProductionLevel?> fetchById(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_productionlevel_id = ?
    ''', [
      id,
    ]);

    return productionSystems.isNotEmpty
        ? FarmerFishProductionLevel.fromSqfliteDatabase(productionSystems.first)
        : null;
  }
  // Add more database methods as needed
}
