import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropmotive.dart';
import '../../database_service.dart';

class CropPlantingMotiveDB {
  final tableName = 'tblfrcropplantingmotive';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "crop_motive_id" INTEGER NOT NULL,
        "crop_motive" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("crop_motive_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String cropMotive,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (crop_motive_id, crop_motive, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      cropMotive,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<CropPlantingMotive>> fetchAll() async {
    final database = await DatabaseService().database;
    final motives = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return motives
        .map((e) => CropPlantingMotive.fromSqfliteDatabase(e))
        .toList();
  }

  Future<CropPlantingMotive> fetchByCropMotiveId(int cropMotiveId) async {
    final database = await DatabaseService().database;
    final motive = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_motive_id = ?
    ''', [cropMotiveId]);

    return CropPlantingMotive.fromSqfliteDatabase(motive.first);
  }

  // Add more database methods as needed
}
