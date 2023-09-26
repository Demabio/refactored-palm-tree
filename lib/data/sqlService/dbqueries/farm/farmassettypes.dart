import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmassettypes.dart';
import '../../database_service.dart';

class FarmAssetTypeDB {
  final tableName = 'tblfrfarmassettype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "asset_type_id" INTEGER NOT NULL,
        "assset_type_code" VARCHAR(255) NOT NULL,
        "asset_name" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("asset_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String assetTypeCode,
    required String assetName,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (asset_type_id, assset_type_code, asset_name, description) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      assetTypeCode,
      assetName,
      description,
    ]);
  }

  Future<int> insertAssetTypes(List<FarmAssetType> assetTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var assetType in assetTypes) {
        batch.rawInsert('''
        INSERT INTO $tableName (asset_type_id, asset_type_code, asset_name, description) 
        VALUES (?, ?, ?, ?)
      ''', [
          assetType.assetTypeId,
          assetType.asssetTypeCode,
          assetType.assetName,
          assetType.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmAssetType>> fetchAll() async {
    final database = await DatabaseService().database;
    final assetTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return assetTypes.map((e) => FarmAssetType.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmAssetType> fetchByAssetTypeId(int assetTypeId) async {
    final database = await DatabaseService().database;
    final assetType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE asset_type_id = ?
    ''', [assetTypeId]);

    return FarmAssetType.fromSqfliteDatabase(assetType.first);
  }

  // Add more database methods as needed
}
