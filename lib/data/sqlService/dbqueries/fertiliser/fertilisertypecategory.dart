import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fertiliser/fertilisertypecategory.dart';
import '../../database_service.dart';

class FertiliserTypeCategoriesDB {
  final tableName = 'tblfrfertilisertypecategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fertiliser_category_id" INTEGER NOT NULL,
        "fertiliser_category" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("fertiliser_category_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String fertiliserCategory,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (fertiliser_category_id, fertiliser_category, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      fertiliserCategory,
      description,
    ]);
  }

  Future<List<FertilizerTypeCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories
        .map((e) => FertilizerTypeCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FertilizerTypeCategory> fetchByFertiliserCategoryId(
      int fertiliserCategoryId) async {
    final database = await DatabaseService().database;
    final category = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fertiliser_category_id = ?
    ''', [fertiliserCategoryId]);

    return FertilizerTypeCategory.fromSqfliteDatabase(category.first);
  }
}
