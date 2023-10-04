import 'package:kiamis_app/data/models/dbModels/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class ExtensionModeDB {
  final tableName = 'tblfrextensionmode';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "extension_mode_id" INTEGER NOT NULL,
        "source_mode" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("extension_mode_id")
      );
    """);
  }

  Future<int> create({
    required String sourceMode,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (source_mode, description) 
      VALUES (?, ?)
    ''', [sourceMode, description]);
  }

  Future<int> insertExtensionModes(List<ExtensionMode> extensionModes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionMode in extensionModes) {
        batch.rawInsert('''
          INSERT INTO $tableName (extension_mode_id, source_mode, description) 
          VALUES (?, ?, ?)
        ''', [
          extensionMode.extensionModeId,
          extensionMode.sourceMode,
          extensionMode.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<ExtensionMode>> fetchAll() async {
    final database = await DatabaseService().database;
    final extensionModes = await database.rawQuery('SELECT * FROM $tableName');
    return extensionModes
        .map((e) => ExtensionMode.fromSqfliteDatabase(e))
        .toList();
  }

  Future<ExtensionMode> fetchByExtensionModeId(int extensionModeId) async {
    final database = await DatabaseService().database;
    final extensionMode = await database.rawQuery(
        'SELECT * FROM $tableName WHERE extension_mode_id = ?',
        [extensionModeId]);
    return ExtensionMode.fromSqfliteDatabase(extensionMode.first);
  }

  // Add more database methods as needed
}
