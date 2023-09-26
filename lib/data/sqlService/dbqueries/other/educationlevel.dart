import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/educationlevel.dart';
import '../../database_service.dart';

class EducationLevelDB {
  final tableName = 'tblfreducationlevel';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "education_level_id" INTEGER NOT NULL,
        "education_level" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("education_level_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String educationLevel,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (education_level_id, education_level, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      educationLevel,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertEducationLevels(
      List<EducationLevel> educationLevels) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var level in educationLevels) {
        batch.rawInsert('''
        INSERT INTO $tableName (education_level_id, education_level, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          level.educationLevelId,
          level.educationLevel,
          level.description,
          level.dateCreated.toLocal().toIso8601String(),
          level.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<EducationLevel>> fetchAll() async {
    final database = await DatabaseService().database;
    final levels = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return levels.map((e) => EducationLevel.fromSqfliteDatabase(e)).toList();
  }

  Future<EducationLevel> fetchByEducationLevelId(int educationLevelId) async {
    final database = await DatabaseService().database;
    final level = await database.rawQuery('''
      SELECT * FROM $tableName WHERE education_level_id = ?
    ''', [educationLevelId]);

    return EducationLevel.fromSqfliteDatabase(level.first);
  }
}
