import 'package:kiamis_app/data/models/farmerregistrationmodels/other/asset.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_asset_id")
      );
    """);
  }

  Future<int> create(FarmerAsset farmerAsset) async {
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var asset in assets) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farm_asset_id, qty, usable_condition, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          asset.farmerId,
          asset.farmerFarmId,
          asset.farmAssetId,
          asset.qty,
          asset.usableCondition,
          DateTime.now().toLocal().toIso8601String(),
          asset.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerAsset>> fetchAll() async {
    final database = await DatabaseService().database;
    final assets = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return assets.map((e) => FarmerAsset.fromSqfliteDatabase(e)).toList();
  }

  Future<List<FarmerAsset>?> fetchAllByfarmer(int id) async {
    final database = await DatabaseService().database;
    final fishCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fishCategories.isNotEmpty
        ? fishCategories.map((e) => FarmerAsset.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);
  }

  // Add more database methods as needed
}
