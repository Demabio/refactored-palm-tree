import 'package:kiamis_app/data/models/dbModels/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class CooperativeGroupDB {
  final tableName = 'tblfrcooperativegroups';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "cooperateive_group_id" INTEGER NOT NULL,
        "group" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("cooperateive_group_id")
      );
    """);
  }

  Future<int> create({
    required String group,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (group, description) 
      VALUES (?, ?)
    ''', [group, description]);
  }

  Future<int> insertCooperativeGroups(
      List<CooperativeGroup> cooperativeGroups) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var cooperativeGroup in cooperativeGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (cooperateive_group_id, "group", description) 
          VALUES (?, ?, ?)
        ''', [
          cooperativeGroup.cooperativeGroupId,
          cooperativeGroup.group,
          cooperativeGroup.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<CooperativeGroup>> fetchAll() async {
    final database = await DatabaseService().database;
    final cooperativeGroups =
        await database.rawQuery('SELECT * FROM $tableName');
    return cooperativeGroups
        .map((e) => CooperativeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<CooperativeGroup> fetchByGroupId(int groupId) async {
    final database = await DatabaseService().database;
    final cooperativeGroup = await database.rawQuery(
        'SELECT * FROM $tableName WHERE cooperateive_group_id = ?', [groupId]);
    return CooperativeGroup.fromSqfliteDatabase(cooperativeGroup.first);
  }

  // Add more database methods as needed
}
