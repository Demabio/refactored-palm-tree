import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/livelihoodsource.dart';
import '../../database_service.dart';

class LivelihoodSourceDB {
  final tableName = 'tblfrlivelihoodsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livelihood_source_id" INTEGER NOT NULL,
        "livelihood_source" VARCHAR(255) NOT NULL,
        "desc" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livelihood_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String livelihoodSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (livelihood_source_id, livelihood_source, desc, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      livelihoodSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<LivelihoodSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final livelihoodSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return livelihoodSources
        .map((e) => LivelihoodSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivelihoodSource> fetchByLivelihoodSourceId(
      int livelihoodSourceId) async {
    final database = await DatabaseService().database;
    final livelihoodSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE livelihood_source_id = ?
    ''', [livelihoodSourceId]);

    return LivelihoodSource.fromSqfliteDatabase(livelihoodSource.first);
  }

  // Add more database methods as needed
}
