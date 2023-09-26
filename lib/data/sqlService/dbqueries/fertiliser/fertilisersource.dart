import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fertiliser/fertilisersource.dart';
import '../../database_service.dart';

class FertiliserSourceDB {
  final tableName = 'tblfrfertilisersource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fert_source_id" INTEGER NOT NULL,
        "source" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("fert_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String source,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (fert_source_id, source, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      source,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFertilizerSources(
      List<FertilizerSource> fertilizerSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in fertilizerSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (fert_source_id, source, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          source.fertSourceId,
          source.source,
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

  Future<List<FertilizerSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final sources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return sources.map((e) => FertilizerSource.fromSqfliteDatabase(e)).toList();
  }

  Future<FertilizerSource> fetchByFertSourceId(int fertSourceId) async {
    final database = await DatabaseService().database;
    final source = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fert_source_id = ?
    ''', [fertSourceId]);

    return FertilizerSource.fromSqfliteDatabase(source.first);
  }

  // Add more database methods as needed
}
