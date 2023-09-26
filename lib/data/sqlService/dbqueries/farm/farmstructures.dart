import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmstructures.dart';
import '../../database_service.dart';

class FarmStructureDB {
  final tableName = 'tblfrfarmstructures';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farm_structure_id" INTEGER NOT NULL,
        "structure_name" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farm_structure_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String structureName,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (farm_structure_id, structure_name, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      structureName,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFarmStructures(List<FarmStructure> farmStructures) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var structure in farmStructures) {
        batch.rawInsert('''
        INSERT INTO $tableName (farm_structure_id, structure_name, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          structure.farmStructureId,
          structure.structureName,
          structure.description,
          structure.dateCreated.toLocal().toIso8601String(),
          structure.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmStructure>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmStructures = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmStructures
        .map((e) => FarmStructure.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmStructure> fetchByFarmStructureId(int farmStructureId) async {
    final database = await DatabaseService().database;
    final farmStructure = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farm_structure_id = ?
    ''', [farmStructureId]);

    return FarmStructure.fromSqfliteDatabase(farmStructure.first);
  }

  // Add more database methods as needed
}
