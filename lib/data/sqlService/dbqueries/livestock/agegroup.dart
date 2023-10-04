import 'package:kiamis_app/data/models/dbModels/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class LivestockAgeGroupDB {
  final tableName = 'tblfrlivestockagegroup';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "age_group_id" INTEGER NOT NULL,
        "age_group" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("age_group_id")
      );
    """);
  }

  Future<int> create({
    required String ageGroup,
    required DateTime dateCreated,
    int? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (age_group, date_created, created_by) 
      VALUES (?, ?, ?)
    ''', [ageGroup, dateCreated.toLocal().toIso8601String(), createdBy]);
  }

  Future<int> insertAgeGroups(List<LivestockAgeGroup> ageGroups) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var ageGroup in ageGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (age_group_id,age_group, date_created, created_by) 
          VALUES (?, ?, ?, ?)
        ''', [
          ageGroup.ageGroupId,
          ageGroup.ageGroup,
          ageGroup.dateCreated.toLocal().toIso8601String(),
          ageGroup.createdBy
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<LivestockAgeGroup>> fetchAll() async {
    final database = await DatabaseService().database;
    final ageGroups = await database.rawQuery('SELECT * FROM $tableName');
    return ageGroups
        .map((e) => LivestockAgeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockAgeGroup> fetchByAgeGroupId(int ageGroupId) async {
    final database = await DatabaseService().database;
    final ageGroup = await database.rawQuery(
        'SELECT * FROM $tableName WHERE age_group_id = ?', [ageGroupId]);
    return LivestockAgeGroup.fromSqfliteDatabase(ageGroup.first);
  }

  // Add more database methods as needed
}
