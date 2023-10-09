import 'package:kiamis_app/data/models/dbModels/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class PFProgressDB {
  final String tableName = 'pf_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("farmId")
      );
    ''');
  }

  Future<int> insert(PFProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("farmId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.farmId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(PFProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?
      WHERE "farmId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.farmId,
    ]);
  }

  Future<PFProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? PFProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
