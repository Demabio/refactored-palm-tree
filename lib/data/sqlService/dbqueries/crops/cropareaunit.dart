import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropareaunit.dart';
import '../../database_service.dart';

class CropAreaUnitDB {
  final tableName = 'tblfrcropareaunit';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "area_unit_id" INTEGER NOT NULL,
        "area_unit" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
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

  Future<CropAreaUnit> fetchByAreaUnitId(int areaUnitId) async {
    final database = await DatabaseService().database;
    final unit = await database.rawQuery('''
      SELECT * FROM $tableName WHERE area_unit_id = ?
    ''', [areaUnitId]);

    return CropAreaUnit.fromSqfliteDatabase(unit.first);
  }
}
