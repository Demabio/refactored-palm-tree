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
        PRIMARY KEY("farmer_asset_source_id")
      );
    """);
  }

  Future<int> create(FarmerAssetSource farmerAssetSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, asset_source_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerAssetSource.farmerId,
      farmerAssetSource.farmerFarmId,
      farmerAssetSource.assetSourceId,
      DateTime.now().toLocal().toIso8601String(),
      farmerAssetSource.createdBy,
    ]);
  }

  Future<int> update(FarmerAssetSource farmerAssetSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        asset_source_id = ? 
      WHERE farmer_asset_source_id = ?
    ''', [
      farmerAssetSource.assetSourceId,
      farmerAssetSource.farmerAssetSource,
    ]);
  }

  Future<int> insertAssetSources(List<FarmerAssetSource> assetSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var assetSource in assetSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, asset_source_id, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          assetSource.farmerId,
          assetSource.farmerFarmId,
          assetSource.assetSourceId,
          DateTime.now().toLocal().toIso8601String(),
          assetSource.createdBy,
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
      SELECT * FROM $tableName 
    ''');

    return assetSources
        .map((e) => FarmerAssetSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerAssetSource?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? FarmerAssetSource.fromSqfliteDatabase(fishCategories.first)
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);
  }

  // Add more database methods as needed
}
