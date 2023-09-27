import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropareaunit.dart';
import '../../database_service.dart';

class CropAreaUnitDB {
  final tableName = 'tblfrcropareaunit';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "area_unit_id" INTEGER NOT NULL,
        "area_unit" VARCHAR(255) ,
        "date_created" DATETIME,
        "created_by" INTEGER,
        PRIMARY KEY("area_unit_id")
      );
    """);
  }

  Future<List<CropAreaUnit>> fetchAll() async {
    final database = await DatabaseService().database;
    final units = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return units.map((e) => CropAreaUnit.fromSqfliteDatabase(e)).toList();
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

  Future<int> insertAreaUnits(List<CropAreaUnit> areaUnits) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var unit in areaUnits) {
        batch.rawInsert('''
        INSERT INTO $tableName (area_unit_id, area_unit, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          unit.areaUnitId,
          unit.areaUnit,
          unit.dateCreated.toLocal().toIso8601String(),
          unit.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<CropAreaUnit> fetchByAreaUnitId(int areaUnitId) async {
    final database = await DatabaseService().database;
    final unit = await database.rawQuery('''
      SELECT * FROM $tableName WHERE area_unit_id = ?
    ''', [areaUnitId]);

    return CropAreaUnit.fromSqfliteDatabase(unit.first);
  }
}
