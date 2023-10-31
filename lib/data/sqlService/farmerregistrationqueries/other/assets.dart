import 'package:kiamis_app/data/models/farmerregistrationmodels/other/asset.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerAssetsDB {
  final tableName = 'tblfrfarmerassets';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_asset_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "farm_asset_id" INTEGER NOT NULL,
        "qty" INTEGER NOT NULL,
        "usable_condition" BOOLEAN ,
        "date_created" DATETIME ,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_asset_id")
      );
    """);
  }

  Future<int> create(FarmerAsset farmerAsset) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farm_asset_id, qty, usable_condition, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerAsset.farmerId,
      farmerAsset.farmerFarmId,
      farmerAsset.farmAssetId,
      farmerAsset.qty,
      farmerAsset.usableCondition,
      DateTime.now().toLocal().toIso8601String(),
      farmerAsset.createdBy,
    ]);
  }

  Future<int> update(FarmerAsset farmerAsset) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      UPDATE  $tableName SET
        farm_asset_id = ?, qty = ?, usable_condition = ?
      WHERE farmer_asset_id = ?
    ''', [
      farmerAsset.farmAssetId,
      farmerAsset.qty,
      farmerAsset.usableCondition,
      farmerAsset.farmerAssetId,
    ]);
  }

  Future<int> insertAssets(List<FarmerAsset> assets) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var asset in assets) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farm_asset_id, qty, usable_condition, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          asset.farmerId,
          asset.farmerFarmId,
          asset.farmAssetId,
          asset.qty,
          asset.usableCondition,
          DateTime.now().toLocal().toIso8601String(),
          asset.createdBy,
          1,
          asset.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertAssets(List<FarmerAsset> assets) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var asset in assets) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, qty = ?, usable_condition = ?, date_created = ? WHERE farmer_farm_id = ? AND farm_asset_id = ?
        ''', [
          asset.qty,
          asset.usableCondition,
          asset.dateCreated?.toLocal().toIso8601String(),
          asset.farmerFarmId,
          asset.farmAssetId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerAsset>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final assets = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return assets.map((e) => FarmerAsset.fromSqfliteDatabase(e)).toList();
  }

  Future<List<FarmerAsset>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories.map((e) => FarmerAsset.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_asset_id = ?
    ''', [id]);
  }

  Future<FarmerAsset?> fetchById(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_asset_id = ? AND active = 1
    ''', [
      id,
    ]);

    return productionSystems.isNotEmpty
        ? FarmerAsset.fromSqfliteDatabase(productionSystems.first)
        : null;
  }

  // Add more database methods as needed
}
