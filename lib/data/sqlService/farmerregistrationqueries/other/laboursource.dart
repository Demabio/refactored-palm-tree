import 'package:kiamis_app/data/models/farmerregistrationmodels/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';

class FarmerLabourSourceDB {
  final tableName = 'tblfrfarmerlaboursource';

  Future<void> createTable() async {
    final database = await FarmerDatabaseService().database;

    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farm_labour_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "labour_source_id" INTEGER NOT NULL,
        "date_created" DATETIME,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farm_labour_source_id")
      );
    """);
  }

  Future<int> create(FarmerLabourSource farmerLabourSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, labour_source_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerLabourSource.farmerId,
      farmerLabourSource.farmerFarmId,
      farmerLabourSource.labourSourceId,
      DateTime.now().toLocal().toIso8601String(),
      farmerLabourSource.createdBy,
    ]);
  }

  Future<int> insertLabourSources(
      List<FarmerLabourSource> labourSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var labourSource in labourSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, labour_source_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          labourSource.farmerId,
          labourSource.farmerFarmId,
          labourSource.labourSourceId,
          DateTime.now().toLocal().toIso8601String(),
          labourSource.createdBy,
          0,
          labourSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertLabourSources(
      List<FarmerLabourSource> labourSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var labourSource in labourSources) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1,  date_created = ? WHERE farmer_farm_id = ? AND labour_source_id = ?
        ''', [
          labourSource.dateCreated?.toLocal().toIso8601String(),
          labourSource.farmerFarmId,
          labourSource.labourSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> update(FarmerLabourSource farmerLabourSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        labour_source_id = ?
      WHERE farm_labour_source_id = ?
    ''', [
      farmerLabourSource.labourSourceId,
      farmerLabourSource.farmLabourSourceId,
    ]);
  }

  Future<List<FarmerLabourSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final labourSources = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return labourSources
        .map((e) => FarmerLabourSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerLabourSource>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories
            .map((e) => FarmerLabourSource.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<List<FarmerLabourSource>?> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories
            .map((e) => FarmerLabourSource.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }

  // Add more database methods as needed
}
