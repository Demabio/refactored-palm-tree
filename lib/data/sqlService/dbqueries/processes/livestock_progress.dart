import 'package:kiamis_app/data/models/dbModels/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class LSProgressDB {
  final String tableName = 'ls_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestockId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("livestockId")
      );
    ''');
  }

  Future<int> insert(LSProgress fiProgress) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("livestockId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.livestockId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(LSProgress fiProgress) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName
      SET "pageOne" = ?, "pageTwo" = ?
      WHERE "livestockId" = ?
    ''', [
      fiProgress.pageOne,
      fiProgress.pageTwo,
      fiProgress.livestockId,
    ]);
  }

  Future<LSProgress?> fetchByLivestock(int livestockId) async {
    final database = await FarmerDatabaseService().database;
    final progress = await database.rawQuery(
        'SELECT * FROM $tableName WHERE "livestockId" = ?', [livestockId]);

    return progress.isNotEmpty
        ? LSProgress.fromSqfliteDatabase(progress.last)
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE livestockId = ?
    ''', [
      id,
    ]);
  }
}
