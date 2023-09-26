import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/irrigation/irrigationcategory.dart';
import '../../database_service.dart';

class IrrigationCategoryDB {
  final tableName = 'tblfrirrigationcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_category_id" INTEGER NOT NULL,
        "irrigation_category" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_category_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String irrigationCategory,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (irrigation_category_id, irrigation_category, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      irrigationCategory,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationCategories(
      List<IrrigationCategory> irrigationCategories) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var category in irrigationCategories) {
        batch.rawInsert('''
        INSERT INTO $tableName (irrigation_category_id, irrigation_category, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          category.irrigationCategoryId,
          category.irrigationCategory,
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

  Future<List<IrrigationCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationCategories
        .map((e) => IrrigationCategory.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IrrigationCategory> fetchByIrrigationCategoryId(
      int irrigationCategoryId) async {
    final database = await DatabaseService().database;
    final irrigationCategory = await database.rawQuery('''
      SELECT * FROM $tableName WHERE irrigation_category_id = ?
    ''', [irrigationCategoryId]);

    return IrrigationCategory.fromSqfliteDatabase(irrigationCategory.first);
  }

  // Add more database methods as needed
}
