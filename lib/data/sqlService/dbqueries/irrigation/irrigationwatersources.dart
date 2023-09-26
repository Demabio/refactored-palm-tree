import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/irrigation/irrigationwatersources.dart';
import '../../database_service.dart';

class IrrigationWaterSourceDB {
  final tableName = 'tblfrirrigationwatersource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_water_source_id" INTEGER NOT NULL,
        "irrigation_water_source" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_water_source_id")
      );
    """);
  }

  Future<List<IrrigationWaterSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final sources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return sources
        .map((e) => IrrigationWaterSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IrrigationWaterSource> fetchByIrrigationWaterSourceId(
      int irrigationWaterSourceId) async {
    final database = await DatabaseService().database;
    final source = await database.rawQuery('''
      SELECT * FROM $tableName WHERE irrigation_water_source_id = ?
    ''', [irrigationWaterSourceId]);

    return IrrigationWaterSource.fromSqfliteDatabase(source.first);
  }
}
