import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropwatersource.dart';
import '../../database_service.dart';

class CropWaterSourceDB {
  final tableName = 'tblfrcropwatersource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "water_source_id" INTEGER NOT NULL,
        "water_source" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("water_source_id")
      );
    """);
  }

  Future<List<CropWaterSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final sources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return sources.map((e) => CropWaterSource.fromSqfliteDatabase(e)).toList();
  }

  Future<int> insertWaterSources(List<CropWaterSource> waterSources) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var source in waterSources) {
        batch.rawInsert('''
        INSERT INTO $tableName (water_source_id, water_source, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          source.waterSourceId,
          source.waterSource,
          source.dateCreated.toLocal().toIso8601String(),
          source.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> create({
    required int id,
    required String waterSource,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (water_source_id, water_source, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      waterSource,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<CropWaterSource> fetchByWaterSourceId(int waterSourceId) async {
    final database = await DatabaseService().database;
    final source = await database.rawQuery('''
      SELECT * FROM $tableName WHERE water_source_id = ?
    ''', [waterSourceId]);

    return CropWaterSource.fromSqfliteDatabase(source.first);
  }
}
