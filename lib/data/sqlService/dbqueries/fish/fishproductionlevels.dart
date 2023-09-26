import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fish/fishproductionlevels.dart';
import '../../database_service.dart';

class FishProductionLevelDB {
  final tableName = 'tblfrfishproductionlevels';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "production_level_id" INTEGER NOT NULL,
        "production_level" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("production_level_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String productionLevel,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (production_level_id, production_level, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      productionLevel,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertProductionLevels(
      List<FishProductionLevel> productionLevels) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var level in productionLevels) {
        batch.rawInsert('''
        INSERT INTO $tableName (production_level_id, production_level, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          level.productionLevelId,
          level.productionLevel,
          level.description,
          level.dateCreated.toLocal().toIso8601String(),
          level.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishProductionLevel>> fetchAll() async {
    final database = await DatabaseService().database;
    final productionLevels = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return productionLevels
        .map((e) => FishProductionLevel.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FishProductionLevel> fetchByProductionLevelId(
      int productionLevelId) async {
    final database = await DatabaseService().database;
    final productionLevel = await database.rawQuery('''
      SELECT * FROM $tableName WHERE production_level_id = ?
    ''', [productionLevelId]);

    return FishProductionLevel.fromSqfliteDatabase(productionLevel.first);
  }

  // Add more database methods as needed
}
