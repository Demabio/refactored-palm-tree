import 'package:kiamis_app/data/models/dbModels/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class LSProgressDB {
  final String tableName = 'lw_progress';

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

  Future<int> insert(LWProgress fiProgress) async {
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

  Future<int> update(LWProgress fiProgress) async {
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

  Future<LWProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmerId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? LWProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
