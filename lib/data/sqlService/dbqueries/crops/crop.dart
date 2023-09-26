import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/crop.dart';
import '../../database_service.dart';

class CropDB {
  final tableName = 'tblfrcrop';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "crop_id" INTEGER NOT NULL,
        "crop_cat_id" INTEGER NOT NULL,
        "crop" VARCHAR(255) NOT NULL,
        "crop_code" VARCHAR(255) NOT NULL,
        "common_crop" BOOLEAN,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("crop_id")
      );
    """);
  }

  Future<int> create({
    required int cropCatId,
    required String crop,
    required String cropCode,
    required bool commonCrop,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (crop_cat_id, crop, crop_code, common_crop, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      cropCatId,
      crop,
      cropCode,
      commonCrop ? 1 : 0,
      DateTime.now().toLocal().toIso8601String(), // Use current datetime
      createdBy,
    ]);
  }

  Future<List<Crop>> fetchAll() async {
    final database = await DatabaseService().database;
    final crops = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return crops.map((e) => Crop.fromSqfliteDatabase(e)).toList();
  }

  Future<Crop> fetchByCropId(int cropId) async {
    final database = await DatabaseService().database;
    final crop = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_id = ?
    ''', [cropId]);

    return Crop.fromSqfliteDatabase(crop.first);
  }

  // Add more database methods as needed
}
