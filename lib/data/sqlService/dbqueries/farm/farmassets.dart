import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmassets.dart';
import '../../database_service.dart';

class FarmAssetDB {
  final tableName = 'tblfrfarmasset';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farm_asset_id" INTEGER NOT NULL,
        "asset_type_id" INTEGER NOT NULL,
        "asset" VARCHAR(255) NOT NULL,
        "asset_code" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farm_asset_id"),
        FOREIGN KEY("asset_type_id") REFERENCES "tblfrfarmassettype"("asset_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required int assetTypeId,
    required String asset,
    required String assetCode,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (farm_asset_id, asset_type_id, asset, asset_code, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      id,
      assetTypeId,
      asset,
      assetCode,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<FarmAsset>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmAssets = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmAssets.map((e) => FarmAsset.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmAsset> fetchByFarmAssetId(int farmAssetId) async {
    final database = await DatabaseService().database;
    final farmAsset = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farm_asset_id = ?
    ''', [farmAssetId]);

    return FarmAsset.fromSqfliteDatabase(farmAsset.first);
  }

  // Add more database methods as needed
}
