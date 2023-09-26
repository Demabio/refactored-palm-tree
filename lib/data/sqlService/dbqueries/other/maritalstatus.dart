import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/maritalstatus.dart';
import '../../database_service.dart';

class MaritalStatusDB {
  final tableName = 'tblfrmaritalstatus';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "marital_status_id" INTEGER NOT NULL,
        "marital_status" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("marital_status_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String maritalStatus,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (marital_status_id, marital_status, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      maritalStatus,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertMaritalStatuses(List<MaritalStatus> maritalStatuses) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var status in maritalStatuses) {
        batch.rawInsert('''
        INSERT INTO $tableName (marital_status_id, marital_status, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          status.maritalStatusId,
          status.maritalStatus,
          status.description,
          status.dateCreated.toLocal().toIso8601String(),
          status.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<MaritalStatus>> fetchAll() async {
    final database = await DatabaseService().database;
    final maritalStatuses = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return maritalStatuses
        .map((e) => MaritalStatus.fromSqfliteDatabase(e))
        .toList();
  }

  Future<MaritalStatus> fetchByMaritalStatusId(int maritalStatusId) async {
    final database = await DatabaseService().database;
    final maritalStatus = await database.rawQuery('''
      SELECT * FROM $tableName WHERE marital_status_id = ?
    ''', [maritalStatusId]);

    return MaritalStatus.fromSqfliteDatabase(maritalStatus.first);
  }

  // Add more database methods as needed
}
