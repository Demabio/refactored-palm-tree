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
        "crop" VARCHAR(255),
        "crop_code" VARCHAR(255),
        "common_crop" VARCHAR(255),
        "date_created" VARCHAR(255),
        "created_by" VARCHAR(255),
        PRIMARY KEY("crop_id" AUTOINCREMENT)
      );
    """);
  }

  Future<List<Crop>> fetchAll() async {
    final database = await DatabaseService().database;
    final crops = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return crops.map((e) => Crop.fromSqfliteDatabase(e)).toList();
  }

  Future<Crop> fetchById(int id) async {
    final database = await DatabaseService().database;
    final crop = await database.rawQuery('''
      SELECT * FROM $tableName WHERE id = ?
    ''', [id]);

    return Crop.fromSqfliteDatabase(crop.first);
  }
}
