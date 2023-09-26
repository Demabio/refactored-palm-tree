import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/crops/cropsystem.dart';
import '../../database_service.dart';

class CropSystemDB {
  final tableName = 'tblfrcropsystem';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "crop_system_id" INTEGER NOT NULL,
        "cropping_system" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("crop_system_id")
      );
    """);
  }

  Future<List<CropSystem>> fetchAll() async {
    final database = await DatabaseService().database;
    final systems = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return systems.map((e) => CropSystem.fromSqfliteDatabase(e)).toList();
  }

  Future<CropSystem> fetchByCropSystemId(int cropSystemId) async {
    final database = await DatabaseService().database;
    final system = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_system_id = ?
    ''', [cropSystemId]);

    return CropSystem.fromSqfliteDatabase(system.first);
  }
}
