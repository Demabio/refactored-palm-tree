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
        "crop_code" VARCHAR(25),
        "common_crop" BOOLEAN,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
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

  Future<int> insertCrops(List<Crop> crops) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var crop in crops) {
        batch.rawInsert('''
      INSERT INTO $tableName (crop_cat_id, crop, crop_code, common_crop, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?, ?)
    ''', [
          crop.cropCategoryId,
          crop.crop,
          crop.cropCode,
          crop.commonCrop ? 1 : 0,
          crop.dateCreated.toLocal().toIso8601String(),
          crop.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<Crop>> fetchAll() async {
    final database = await DatabaseService().database;
    final crops = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return crops.map((e) => Crop.fromSqfliteDatabase(e)).toList();
  }

  Future<List<Crop>> fetchCommonCrops() async {
    final database = await DatabaseService().database;
    final crops = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE common_crop = 1
    ''');

    return crops.map((e) => Crop.fromSqfliteDatabase(e)).toList();
  }

  Future<List<Crop>> searchCrops(String crop) async {
    final database = await DatabaseService().database;
    final crops = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop LIKE '%' ||  ? || '%' LIMIT 5
    ''', [crop]);

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
