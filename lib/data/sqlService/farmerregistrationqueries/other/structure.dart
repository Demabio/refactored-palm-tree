import 'package:kiamis_app/data/models/farmerregistrationmodels/other/farmstructure.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerStructureDB {
  final tableName = 'tblfrfarmerstructures';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_asset_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "farm_structure_id" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_asset_id")
      );
    """);
  }

  Future<int> create(FarmerStructure farmerStructure) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farm_structure_id, 
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerStructure.farmerId,
      farmerStructure.farmerFarmId,
      farmerStructure.farmStructureId,
      DateTime.now().toLocal().toIso8601String(),
      farmerStructure.createdBy,
    ]);
  }

  Future<int> update(FarmerStructure farmerStructure) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        farm_structure_id = ? 
      WHERE farmer_asset_id = ?
    ''', [
      farmerStructure.farmStructureId,
      farmerStructure.farmerAssetId,
    ]);
  }

  Future<int> insertStructures(List<FarmerStructure> structures) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var structure in structures) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farm_structure_id, 
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          structure.farmerId,
          structure.farmerFarmId,
          structure.farmStructureId,
          structure.dateCreated?.toLocal().toIso8601String(),
          structure.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerStructure>> fetchAll() async {
    final database = await DatabaseService().database;
    final structures = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return structures
        .map((e) => FarmerStructure.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
