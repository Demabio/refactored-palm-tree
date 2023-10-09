import 'package:kiamis_app/data/models/dbModels/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FSProgressDB {
  final String tableName = 'fs_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmerId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("farmerId")
      );
    ''');
  }

  Future<int> insert(FSProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("farmerId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.farmerId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(FSProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?
      WHERE "farmerId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.farmerId,
    ]);
  }

  Future<FSProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmerId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? FSProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
