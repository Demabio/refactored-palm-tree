import 'package:kiamis_app/data/models/dbModels/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class LSIProgressDB {
  final String tableName = 'lsi_progress';

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

  Future<int> insert(FIProgress fiProgress) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("farmerId", "pageOne", "pageTwo")
      VALUES (?, ?, ?, ?, ?)
    ''', [
      fiProgress.farmerId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(FIProgress fiProgress) async {
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

  Future<FIProgress?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmerId" = ?', [farmerId]);

    return progress.isNotEmpty
        ? FIProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
