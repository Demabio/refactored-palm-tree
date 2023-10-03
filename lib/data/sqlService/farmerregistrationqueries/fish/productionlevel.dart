import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionlevel.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_productionlevel_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int productionLevelId,
    bool? fertilizerInPonds,
    String? espBenefit,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, production_level_id, fertilizer_in_ponds, esp_benefit, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      productionLevelId,
      fertilizerInPonds! ? 1 : 0,
      espBenefit,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertProductionLevels(
      List<FarmerFishProductionLevel> productionLevels) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var productionLevel in productionLevels) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, production_level_id, fertilizer_in_ponds, esp_benefit, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          productionLevel.farmerId,
          productionLevel.farmerFarmId,
          productionLevel.productionLevelId,
          productionLevel.fertilizerInPonds ? 1 : 0,
          productionLevel.espBenefit,
          productionLevel.dateCreated.toLocal().toIso8601String(),
          productionLevel.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFishProductionLevel>> fetchAll() async {
    final database = await DatabaseService().database;
    final productionLevels = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return productionLevels
        .map((e) => FarmerFishProductionLevel.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}