import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/agriculturalinfosource.dart';
import '../../database_service.dart';

class AgriInfoSourceDB {
  final tableName = 'tblfragriinfosource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "agri_info_source_id" INTEGER NOT NULL,
        "agri_info_source" VARCHAR(255) NOT NULL,
        "desc" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("agri_info_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String agriInfoSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (agri_info_source_id, agri_info_source, desc, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      agriInfoSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertAgriInfoSources(
      List<AgriInfoSource> agriInfoSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in agriInfoSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (agri_info_source_id, agri_info_source, desc, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          source.agriInfoSourceId,
          source.agriInfoSource,
          source.description,
          source.dateCreated.toLocal().toIso8601String(),
          source.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<AgriInfoSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final agriInfoSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return agriInfoSources
        .map((e) => AgriInfoSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<AgriInfoSource> fetchByAgriInfoSourceId(int agriInfoSourceId) async {
    final database = await DatabaseService().database;
    final agriInfoSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE agri_info_source_id = ?
    ''', [agriInfoSourceId]);

    return AgriInfoSource.fromSqfliteDatabase(agriInfoSource.first);
  }

  // Add more database methods as needed
}
