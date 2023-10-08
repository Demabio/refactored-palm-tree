import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FIProgressDB {
  final String tableName = 'fi_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmerId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        "pageThree" INTEGER NOT NULL,
        "pageFour" INTEGER NOT NULL,
        PRIMARY KEY("farmerId")
      );
    ''');
  }

  Future<int> insert(FIProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("farmerId", "pageOne", "pageTwo", "pageThree", "pageFour")
      VALUES (?, ?, ?, ?, ?)
    ''', [
      fiProgress.farmerId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.pageThree,
      fiProgress.pageFour,
    ]);
  }

  Future<int> update(FIProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?, "pageThree" = ?, "pageFour" = ?
      WHERE "farmerId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.pageThree,
      fiProgress.pageFour,
      fiProgress.farmerId,
    ]);
  }

  Future<FIProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmerId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? FIProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
