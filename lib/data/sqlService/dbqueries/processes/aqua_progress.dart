import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class AQProgressDB {
  final String tableName = 'aq_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "fishId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("fishId")
      );
    ''');
  }

  Future<int> insert(AQProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("fishId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.fishId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(AQProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?
      WHERE "fishId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.fishId,
    ]);
  }

  Future<AQProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "fishId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? AQProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
