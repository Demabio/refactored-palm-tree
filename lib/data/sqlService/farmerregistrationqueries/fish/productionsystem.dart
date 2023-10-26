import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionsystem.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFishProductionSystemDB {
  final tableName = 'tblfrfarmerfishproductionsystem';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fishprod_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "production_type_id" INTEGER NOT NULL,
        "production_status" TEXT,
        "active_area" REAL,
        "no_of_active_units" INTEGER,
        "inactive_area" REAL,
        "no_of_inactive_units" INTEGER,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_fishprod_id")
      );
    """);
  }

  Future<int> create(
      FarmerFishProductionSystem farmerFishProductionSystem) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, production_type_id, production_status, active_area,
        no_of_active_units, inactive_area, no_of_inactive_units, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerFishProductionSystem.farmerId,
      farmerFishProductionSystem.farmerFarmId,
      farmerFishProductionSystem.productionTypeId,
      farmerFishProductionSystem.productionStatus,
      farmerFishProductionSystem.activeArea,
      farmerFishProductionSystem.noOfActiveUnits,
      farmerFishProductionSystem.inactiveArea,
      farmerFishProductionSystem.noOfInactiveUnits,
      DateTime.now().toLocal().toIso8601String(),
      farmerFishProductionSystem.createdBy,
    ]);
  }

  Future<int> update(
      FarmerFishProductionSystem farmerFishProductionSystem) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        production_type_id = ?, production_status = ?, active_area = ?, no_of_active_units = ?, inactive_area = ?, no_of_inactive_units = ?
      WHERE farmer_fishprod_id = ?
    ''', [
      farmerFishProductionSystem.productionTypeId,
      farmerFishProductionSystem.productionStatus,
      farmerFishProductionSystem.activeArea,
      farmerFishProductionSystem.noOfActiveUnits,
      farmerFishProductionSystem.inactiveArea,
      farmerFishProductionSystem.noOfInactiveUnits,
      farmerFishProductionSystem.farmerFishprodId,
    ]);
  }

  Future<int> insertProductionSystems(
      List<FarmerFishProductionSystem> productionSystems) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var productionSystem in productionSystems) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, production_type_id, production_status, active_area,
            no_of_active_units, inactive_area, no_of_inactive_units, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          productionSystem.farmerId,
          productionSystem.farmerFarmId,
          productionSystem.productionTypeId,
          productionSystem.productionStatus,
          productionSystem.activeArea,
          productionSystem.noOfActiveUnits,
          productionSystem.inactiveArea,
          productionSystem.noOfInactiveUnits,
          productionSystem.dateCreated.toLocal().toIso8601String(),
          productionSystem.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFishProductionSystem>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return productionSystems
        .map((e) => FarmerFishProductionSystem.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerFishProductionSystem>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return productionSystems
        .map((e) => FarmerFishProductionSystem.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFishProductionSystem?> fetchById(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_fishprod_id = ?
    ''', [
      id,
    ]);

    return productionSystems.isNotEmpty
        ? FarmerFishProductionSystem.fromSqfliteDatabase(
            productionSystems.first)
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_fishprod_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed
}
