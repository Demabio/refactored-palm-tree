import 'package:sqflite/sqflite.dart';

import '../../presentation/login_screen/models/loginmodels.dart';
import 'database_service.dart';

class LoginDB {
  final tableName = 'login';

  Future<void> createTable(Database database) async {
    await database.execute("""
  CREATE TABLE IF NOT EXISTS $tableName (
    "id" INTEGER NOT NULL,
    "username" VARCHAR(100),
    PRIMARY KEY("id" AUTOINCREMENT)
  );
""");
  }

  Future<int> create({required String username}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
INSERT INTO $tableName (username) VALUES (?) 
''', [
      username
// , DateTime.now().millisecondsSinceEpoch
    ]);
  }

  Future<List<Login>> fetchAll() async {
    final database = await DatabaseService().database;
    final logins = await database.rawQuery(''' 
    SELECT * from $tableName 
    ''');

    return logins.map((e) => Login.fromSqfliteDatabase(e)).toList();
  }

  Future<Login> fetchById(int id) async {
    final database = await DatabaseService().database;
    final login = await database.rawQuery('''
    SELECT * FROM $tableName WHERE id =?
    ''', [id]);
    return Login.fromSqfliteDatabase(login.first);
  }

  Future<int> update({required int id, String? username}) async {
    final database = await DatabaseService().database;
    return await database.update(
        tableName,
        {
          if (username != null) 'username': username,
        },
        where: 'id = ?',
        conflictAlgorithm: ConflictAlgorithm.rollback,
        whereArgs: [id]);
  }

  Future<void> delete(int id) async {
    final database = await DatabaseService().database;
    await database.rawDelete('''
DELETE FROM $tableName WHERE id = ?
''', [id]);
  }
}
