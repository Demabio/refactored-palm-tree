import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/livestock/livestocksubcategory.dart';
import '../../database_service.dart';

class LivestockSubcategoryDB {
  final tableName = 'tblfrlivestocksubcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_sub_cat_id" INTEGER NOT NULL,
        "livestock_cat_id" INTEGER NOT NULL,
        "livestock_subcategory" VARCHAR(255) NOT NULL,
        "livestock_subcategory_code" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livestock_sub_cat_id"),
        FOREIGN KEY("livestock_cat_id") REFERENCES "tblfrlivestockcategories"("livestock_cat_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required int livestockCategoryId,
    required String livestockSubcategory,
    required String livestockSubcategoryCode,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (livestock_sub_cat_id, livestock_cat_id, livestock_subcategory, livestock_subcategory_code, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      id,
      livestockCategoryId,
      livestockSubcategory,
      livestockSubcategoryCode,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<LivestockSubcategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final subcategories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return subcategories
        .map((e) => LivestockSubcategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockSubcategory> fetchByLivestockSubcategoryId(
      int livestockSubcategoryId) async {
    final database = await DatabaseService().database;
    final subcategory = await database.rawQuery('''
      SELECT * FROM $tableName WHERE livestock_sub_cat_id = ?
    ''', [livestockSubcategoryId]);

    return LivestockSubcategory.fromSqfliteDatabase(subcategory.first);
  }

  // Add more database methods as needed
}
