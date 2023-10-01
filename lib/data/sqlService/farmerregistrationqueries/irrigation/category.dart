import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationCategoryDB {
  final tableName = 'tblfrfarmersirrigationcategories';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "irrigation_category_id" INTEGER NOT NULL,
        "irrigation_project_name" VARCHAR(255) NOT NULL,
        "membership_type_id" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int irrigationCategoryId,
    required String irrigationProjectName,
    required int membershipTypeId,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, irrigation_category_id, irrigation_project_name, membership_type_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      irrigationCategoryId,
      irrigationProjectName,
      membershipTypeId,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationCategories(
      List<FarmerIrrigationCategory> irrigationCategories) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationCategory in irrigationCategories) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, irrigation_category_id, irrigation_project_name, membership_type_id, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          irrigationCategory.farmerId,
          irrigationCategory.irrigationCategoryId,
          irrigationCategory.irrigationProjectName,
          irrigationCategory.membershipTypeId,
          irrigationCategory.dateCreated.toLocal().toIso8601String(),
          irrigationCategory.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationCategory>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationCategories = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationCategories
        .map((e) => FarmerIrrigationCategory.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
