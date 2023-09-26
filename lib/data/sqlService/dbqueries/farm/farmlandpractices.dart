import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmlandpractices.dart';
import '../../database_service.dart';

class FarmlandPracticeDB {
  final tableName = 'tblfrfarmlandpractices';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "land_practice_id" INTEGER NOT NULL,
        "land_practice_name" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("land_practice_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String landPracticeName,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (land_practice_id, land_practice_name, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      landPracticeName,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<FarmlandPractice>> fetchAll() async {
    final database = await DatabaseService().database;
    final landPractices = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return landPractices
        .map((e) => FarmlandPractice.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmlandPractice> fetchByLandPracticeId(int landPracticeId) async {
    final database = await DatabaseService().database;
    final landPractice = await database.rawQuery('''
      SELECT * FROM $tableName WHERE land_practice_id = ?
    ''', [landPracticeId]);

    return FarmlandPractice.fromSqfliteDatabase(landPractice.first);
  }

  // Add more database methods as needed
}
