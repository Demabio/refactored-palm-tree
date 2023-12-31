import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmassetsource.dart';
import '../../database_service.dart';

class FarmAssetSourceDB {
  final tableName = 'tblfrfarmassetsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "asset_source_id" INTEGER NOT NULL,
        "asset_source" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("asset_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String assetSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (asset_source_id, asset_source, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      assetSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertAssetSources(List<FarmAssetSource> assetSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in assetSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (asset_source_id, asset_source, description) 
        VALUES (?, ?, ?)
      ''', [
          source.assetSourceId,
          source.assetSource,
          source.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmAssetSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final assetSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return assetSources
        .map((e) => FarmAssetSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmAssetSource> fetchByAssetSourceId(int assetSourceId) async {
    final database = await DatabaseService().database;
    final assetSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE asset_source_id = ?
    ''', [assetSourceId]);

    return FarmAssetSource.fromSqfliteDatabase(assetSource.first);
  }

  // Add more database methods as needed
}
