import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fish/fishproductionuom.dart';
import '../../database_service.dart';

class FishProductionUnitOfMeasureDB {
  final tableName = 'tblfrfishtproductionunitofmeasure';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "unit_of_measure_id" INTEGER NOT NULL,
        "unit_of_measure" VARCHAR(255) NOT NULL,
        PRIMARY KEY("unit_of_measure_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String unitOfMeasure,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (unit_of_measure_id, unit_of_measure) 
      VALUES (?, ?)
    ''', [
      id,
      unitOfMeasure,
    ]);
  }

  Future<int> insertUnitOfMeasures(
      List<FishProductionUnitOfMeasure> unitOfMeasures) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var unit in unitOfMeasures) {
        batch.rawInsert('''
        INSERT INTO $tableName (unit_of_measure_id, unit_of_measure) 
        VALUES (?, ?)
      ''', [
          unit.unitOfMeasureId,
          unit.unitOfMeasure,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishProductionUnitOfMeasure>> fetchAll() async {
    final database = await DatabaseService().database;
    final unitOfMeasures = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return unitOfMeasures
        .map((e) => FishProductionUnitOfMeasure.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FishProductionUnitOfMeasure> fetchByUnitOfMeasureId(
      int unitOfMeasureId) async {
    final database = await DatabaseService().database;
    final unitOfMeasure = await database.rawQuery('''
      SELECT * FROM $tableName WHERE unit_of_measure_id = ?
    ''', [unitOfMeasureId]);

    return FishProductionUnitOfMeasure.fromSqfliteDatabase(unitOfMeasure.first);
  }

  // Add more database methods as needed
}
