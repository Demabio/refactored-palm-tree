import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/fish/fishcategory.dart';
import '../../database_service.dart';

class FishCategoryDB {
  final tableName = 'tblfrfishcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "fish_category_id" INTEGER NOT NULL,
        "fish_category" VARCHAR(255) NOT NULL,
        "fish_category_code" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("fish_category_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String fishCategory,
    required String fishCategoryCode,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (fish_category_id, fish_category, fish_category_code, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      id,
      fishCategory,
      fishCategoryCode,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFishCategories(List<FishCategory> fishCategories) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var category in fishCategories) {
        batch.rawInsert('''
        INSERT INTO $tableName (fish_category_id, fish_category, fish_category_code, description, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?, ?)
      ''', [
          category.fishCategoryId,
          category.fishCategory,
          category.fishCategoryCode,
          category.description,
          category.dateCreated.toLocal().toIso8601String(),
          category.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FishCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories.map((e) => FishCategory.fromSqfliteDatabase(e)).toList();
  }

  Future<FishCategory> fetchByFishCategoryId(int fishCategoryId) async {
    final database = await DatabaseService().database;
    final category = await database.rawQuery('''
      SELECT * FROM $tableName WHERE fish_category_id = ?
    ''', [fishCategoryId]);

    return FishCategory.fromSqfliteDatabase(category.first);
  }

  // Add more database methods as needed
}
