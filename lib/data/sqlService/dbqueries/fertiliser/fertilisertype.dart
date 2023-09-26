import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fertiliser/fertilisertype.dart';
import '../../database_service.dart';

class FertiliserTypeDB {
  final tableName = 'tblfrfertilisertype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fertiliser_type_id" INTEGER NOT NULL,
        "fertiliser_category_id" INTEGER NOT NULL,
        "fertiliser_type" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("fertiliser_type_id"),
        FOREIGN KEY("fertiliser_category_id") REFERENCES "tblfrfertilisertypecategories"("fertiliser_category_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required int fertiliserCategoryId,
    required String fertiliserType,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (fertiliser_type_id, fertiliser_category_id, fertiliser_type, description) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      fertiliserCategoryId,
      fertiliserType,
      description,
    ]);
  }

  Future<int> insertFertilizerTypes(
      List<FertilizerType> fertilizerTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var type in fertilizerTypes) {
        batch.rawInsert('''
        INSERT INTO $tableName (fertiliser_type_id, fertiliser_category_id, fertiliser_type, description) 
        VALUES (?, ?, ?, ?)
      ''', [
          type.fertiliserTypeId,
          type.fertiliserCategoryId,
          type.fertiliserType,
          type.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FertilizerType>> fetchAll() async {
    final database = await DatabaseService().database;
    final types = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return types.map((e) => FertilizerType.fromSqfliteDatabase(e)).toList();
  }

  Future<FertilizerType> fetchByFertiliserTypeId(int fertiliserTypeId) async {
    final database = await DatabaseService().database;
    final type = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fertiliser_type_id = ?
    ''', [fertiliserTypeId]);

    return FertilizerType.fromSqfliteDatabase(type.first);
  }

  // Add more database methods as needed
}
