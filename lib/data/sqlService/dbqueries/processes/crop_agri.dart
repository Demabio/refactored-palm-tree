import 'package:kiamis_app/data/models/dbModels/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class CAProgressDB {
  final String tableName = 'ca_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "cropId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("cropId")
      );
    ''');
  }

  Future<int> insert(CAProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("cropId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.cropId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(CAProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?
      WHERE "cropId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.cropId,
    ]);
  }

  Future<CAProgress?> fetchByCropId(int cropid) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "cropId" = ?', [cropid]);

    return progress.isNotEmpty
        ? CAProgress.fromSqfliteDatabase(progress.first)
        : null;
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE cropId = ?
    ''', [
      id,
    ]);
  }
}
