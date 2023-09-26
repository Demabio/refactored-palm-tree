import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/conservationagripractices.dart';
import '../../database_service.dart';

class AgriPracticeDB {
  final tableName = 'tblfragripractice';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "agri_practice_id" INTEGER NOT NULL,
        "agri_practice" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("agri_practice_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String agriPractice,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (agri_practice_id, agri_practice, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      agriPractice,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertAgriPractices(List<AgriPractice> agriPractices) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var practice in agriPractices) {
        batch.rawInsert('''
        INSERT INTO $tableName (agri_practice_id, agri_practice, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          practice.agriPracticeId,
          practice.agriPractice,
          practice.dateCreated.toLocal().toIso8601String(),
          practice.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<AgriPractice>> fetchAll() async {
    final database = await DatabaseService().database;
    final agriPractices = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return agriPractices
        .map((e) => AgriPractice.fromSqfliteDatabase(e))
        .toList();
  }

  Future<AgriPractice> fetchByAgriPracticeId(int agriPracticeId) async {
    final database = await DatabaseService().database;
    final agriPractice = await database.rawQuery('''
      SELECT * FROM $tableName WHERE agri_practice_id = ?
    ''', [agriPracticeId]);

    return AgriPractice.fromSqfliteDatabase(agriPractice.first);
  }

  // Add more database methods as needed
}
