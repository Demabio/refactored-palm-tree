import 'package:kiamis_app/data/models/farmerregistrationmodels/other/assetsource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerAssetSourceDB {
  final tableName = 'tblfrfarmerassetsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_asset_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "asset_source_id" INTEGER NOT NULL,
        "date_created" DATETIME ,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_asset_source_id")
      );
    """);
  }

  Future<int> create(FarmerAssetSource farmerAssetSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, asset_source_id, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerAssetSource.farmerId,
      farmerAssetSource.farmerFarmId,
      farmerAssetSource.assetSourceId,
      DateTime.now().toLocal().toIso8601String(),
      farmerAssetSource.createdBy,
      1,
      farmerAssetSource.createdBy,
    ]);
  }

  Future<int> update(FarmerAssetSource farmerAssetSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        asset_source_id = ?, active = 1
      WHERE farmer_farm_id = ?
    ''', [
      farmerAssetSource.assetSourceId,
      farmerAssetSource.farmerFarmId,
    ]);
  }

  Future<int> insertAssetSources(List<FarmerAssetSource> assetSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var assetSource in assetSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, asset_source_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          assetSource.farmerId,
          assetSource.farmerFarmId,
          assetSource.assetSourceId,
          DateTime.now().toLocal().toIso8601String(),
          assetSource.createdBy,
          1,
          assetSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertAssetSources(List<FarmerAssetSource> assetSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var assetSource in assetSources) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ? WHERE farmer_farm_id = ? AND asset_source_id = ?
        ''', [
          assetSource.dateCreated?.toLocal().toIso8601String(),
          assetSource.farmerFarmId,
          assetSource.assetSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerAssetSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final assetSources = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return assetSources
        .map((e) => FarmerAssetSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerAssetSource?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? FarmerAssetSource.fromSqfliteDatabase(fishCategories.first)
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
