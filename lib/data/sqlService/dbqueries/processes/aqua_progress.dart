import 'package:kiamis_app/data/models/dbModels/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class AQProgressDB {
  final String tableName = 'aq_progress';

  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmId" INTEGER NOT NULL,
        "pageOne" INTEGER NOT NULL,
        "pageTwo" INTEGER NOT NULL,
        PRIMARY KEY("farmid")
      );
    ''');
  }

  Future<int> insert(AQProgress fiProgress) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName ("farmId", "pageOne", "pageTwo")
      VALUES (?, ?, ?)
    ''', [
      fiProgress.farmId,
      fiProgress.pageOne,
      fiProgress.pageTwo,
    ]);
  }

  Future<int> update(AQProgress fiProgress) async {
    final database = await FarmerDatabaseService().database;
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

  Future<AQProgress?> fetchByFarmId(int farmId) async {
    final database = await FarmerDatabaseService().database;
    final progress = await database
        .rawQuery('SELECT * FROM $tableName WHERE "farmId" = ?', [farmId]);

    return progress.isNotEmpty
        ? AQProgress.fromSqfliteDatabase(progress.first)
        : null;
  }
}
