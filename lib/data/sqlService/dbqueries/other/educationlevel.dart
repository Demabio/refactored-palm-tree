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
