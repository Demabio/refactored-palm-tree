import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropscategory.dart';
import '../../database_service.dart';

class CropCategoriesDB {
  final tableName = 'tblfrcropcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "crop_cat_id" INTEGER NOT NULL,
        "crop_category" VARCHAR(255) NOT NULL,
        "crop_category_code" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("crop_cat_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String cropCategory,
    required String cropCategoryCode,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (crop_cat_id, crop_category, crop_category_code, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      cropCategory,
      cropCategoryCode,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertCropCategories(List<CropCategory> cropCategories) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var category in cropCategories) {
        batch.rawInsert('''
        INSERT INTO $tableName (crop_cat_id, crop_category, crop_category_code, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          category.cropCategoryId,
          category.cropCategory,
          category.cropCategoryCode,
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

  Future<List<CropCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories.map((e) => CropCategory.fromSqfliteDatabase(e)).toList();
  }

  Future<CropCategory> fetchByCropCatId(int cropCatId) async {
    final database = await DatabaseService().database;
    final category = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_cat_id = ?
    ''', [cropCatId]);

    return CropCategory.fromSqfliteDatabase(category.first);
  }

  // Add more database methods as needed
}
