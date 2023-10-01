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
        "usable_condition" BOOLEAN NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_asset_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int farmAssetId,
    required int qty,
    required bool usableCondition,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farm_asset_id, qty, usable_condition, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      farmAssetId,
      qty,
      usableCondition ? 1 : 0,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
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
          asset.dateCreated.toLocal().toIso8601String(),
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

  // Add more database methods as needed
}
