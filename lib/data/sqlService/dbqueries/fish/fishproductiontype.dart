import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fish/fishproductiontype.dart';
import '../../database_service.dart';

class FishProductionTypeDB {
  final tableName = 'tblfrfishtproductiontypes';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "production_type_id" INTEGER NOT NULL,
        "fish_production_type" VARCHAR(255) NOT NULL,
        "unit_of_measure_id" INTEGER NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("production_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String fishProductionType,
    required int unitOfMeasureId,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (production_type_id, fish_production_type, unit_of_measure_id, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      id,
      fishProductionType,
      unitOfMeasureId,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFishProductionTypes(
      List<FishProductionType> fishProductionTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var type in fishProductionTypes) {
        batch.rawInsert('''
        INSERT INTO $tableName (production_type_id, fish_production_type, unit_of_measure_id, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?, ?)
      ''', [
          type.productionTypeId,
          type.fishProductionType,
          type.unitOfMeasureId,
          type.description,
          type.dateCreated.toLocal().toIso8601String(),
          type.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishProductionType>> fetchAll() async {
    final database = await DatabaseService().database;
    final productionTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return productionTypes
        .map((e) => FishProductionType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FishProductionType> fetchByProductionTypeId(
      int productionTypeId) async {
    final database = await DatabaseService().database;
    final productionType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE production_type_id = ?
    ''', [productionTypeId]);

    return FishProductionType.fromSqfliteDatabase(productionType.first);
  }

  // Add more database methods as needed
}
