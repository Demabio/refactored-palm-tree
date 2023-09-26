import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmpowersource.dart';
import '../../database_service.dart';

class FarmPowerSourceDB {
  final tableName = 'tblfrfarmpowersource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "power_source_id" INTEGER NOT NULL,
        "power_source" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("power_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String powerSource,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (power_source_id, power_source, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      powerSource,
      description,
    ]);
  }

  Future<int> insertPowerSources(List<FarmPowerSource> powerSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in powerSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (power_source_id, power_source, description) 
        VALUES (?, ?, ?)
      ''', [
          source.powerSourceId,
          source.powerSource,
          source.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmPowerSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final powerSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return powerSources
        .map((e) => FarmPowerSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmPowerSource> fetchByPowerSourceId(int powerSourceId) async {
    final database = await DatabaseService().database;
    final powerSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE power_source_id = ?
    ''', [powerSourceId]);

    return FarmPowerSource.fromSqfliteDatabase(powerSource.first);
  }

  // Add more database methods as needed
}
