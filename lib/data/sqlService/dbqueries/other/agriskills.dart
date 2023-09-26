import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/agriskills.dart';
import '../../database_service.dart';

class AgriManagementSkillsDB {
  final tableName = 'tblfragrimgmtskills';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "agri_skills_id" INTEGER NOT NULL,
        "agri_skills" VARCHAR(255) NOT NULL,
        "desc" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("agri_skills_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String agriSkills,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (agri_skills_id, agri_skills, desc, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      agriSkills,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<AgriManagementSkill>> fetchAll() async {
    final database = await DatabaseService().database;
    final agriSkills = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return agriSkills
        .map((e) => AgriManagementSkill.fromSqfliteDatabase(e))
        .toList();
  }

  Future<AgriManagementSkill> fetchByAgriSkillsId(int agriSkillsId) async {
    final database = await DatabaseService().database;
    final agriSkills = await database.rawQuery('''
      SELECT * FROM $tableName WHERE agri_skills_id = ?
    ''', [agriSkillsId]);

    return AgriManagementSkill.fromSqfliteDatabase(agriSkills.first);
  }

  // Add more database methods as needed
}
