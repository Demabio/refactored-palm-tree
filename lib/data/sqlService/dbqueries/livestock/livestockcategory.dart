import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/livestock/livestockcategory.dart';
import '../../database_service.dart';

class LivestockCategoryDB {
  final tableName = 'tblfrlivestockcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_cat_id" INTEGER NOT NULL,
        "livestock_category" VARCHAR(255) NOT NULL,
        "livestock_category_code" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livestock_cat_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String livestockCategory,
    required String livestockCategoryCode,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (livestock_cat_id, livestock_category, livestock_category_code, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      livestockCategory,
      livestockCategoryCode,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<LivestockCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final categories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return categories
        .map((e) => LivestockCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockCategory> fetchByLivestockCategoryId(
      int livestockCategoryId) async {
    final database = await DatabaseService().database;
    final category = await database.rawQuery('''
      SELECT * FROM $tableName WHERE livestock_cat_id = ?
    ''', [livestockCategoryId]);

    return LivestockCategory.fromSqfliteDatabase(category.first);
  }

  // Add more database methods as needed
}
