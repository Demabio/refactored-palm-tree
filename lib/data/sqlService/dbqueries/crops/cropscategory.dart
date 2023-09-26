import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropscategory.dart';
import '../../database_service.dart';

class CropCategoryDB {
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

  Future<List<CropCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories.map((e) => CropCategory.fromSqfliteDatabase(e)).toList();
  }

  Future<CropCategory> fetchByCropCategoryId(int cropCategoryId) async {
    final database = await DatabaseService().database;
    final category = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_cat_id = ?
    ''', [cropCategoryId]);

    return CropCategory.fromSqfliteDatabase(category.first);
  }
}
