import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/extensionsources.dart';
import '../../database_service.dart';

class ExtensionSourceDB {
  final tableName = 'tblfrextensionsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "extension_source_id" INTEGER NOT NULL,
        "source_type" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("extension_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String sourceType,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (extension_source_id, source_type, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      sourceType,
      description,
    ]);
  }

  Future<int> insertExtensionSources(
      List<ExtensionSource> extensionSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in extensionSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (extension_source_id, source_type, description) 
        VALUES (?, ?, ?)
      ''', [
          source.extensionSourceId,
          source.sourceType,
          source.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<ExtensionSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final sources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return sources.map((e) => ExtensionSource.fromSqfliteDatabase(e)).toList();
  }

  Future<ExtensionSource> fetchByExtensionSourceId(
      int extensionSourceId) async {
    final database = await DatabaseService().database;
    final source = await database.rawQuery('''
      SELECT * FROM $tableName WHERE extension_source_id = ?
    ''', [extensionSourceId]);

    return ExtensionSource.fromSqfliteDatabase(source.first);
  }

  // Add more database methods as needed
}
