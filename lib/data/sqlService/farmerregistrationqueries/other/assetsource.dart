import 'package:kiamis_app/data/models/farmerregistrationmodels/other/assetsource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_asset_source_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int assetSourceId,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, asset_source_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      assetSourceId,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertAssetSources(List<FarmerAssetSource> assetSources) async {
    final database = await DatabaseService().database;
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
          assetSource.dateCreated.toLocal().toIso8601String(),
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
    final database = await DatabaseService().database;
    final assetSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return assetSources
        .map((e) => FarmerAssetSource.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
