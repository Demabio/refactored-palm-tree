import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/laboursource.dart';
import '../../database_service.dart';

class LabourSourceDB {
  final tableName = 'tblfrlaboursource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "labour_source_id" INTEGER NOT NULL,
        "labour_source" VARCHAR(255) NOT NULL,
        "desc" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("labour_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String labourSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (labour_source_id, labour_source, desc, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      labourSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<LabourSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final labourSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return labourSources
        .map((e) => LabourSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LabourSource> fetchByLabourSourceId(int labourSourceId) async {
    final database = await DatabaseService().database;
    final labourSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE labour_source_id = ?
    ''', [labourSourceId]);

    return LabourSource.fromSqfliteDatabase(labourSource.first);
  }

  // Add more database methods as needed
}
