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

  Future<int> create({
    required int id,
    required String areaUnit,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (area_unit_id, area_unit, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      areaUnit,
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
