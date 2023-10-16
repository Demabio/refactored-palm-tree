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

  Future<int> create({
    required int id,
    required String croppingSystem,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (crop_system_id, cropping_system, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      croppingSystem,
      description,
    ]);
  }

  Future<int> insertCroppingSystems(List<CropSystem> croppingSystems) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var system in croppingSystems) {
        batch.rawInsert('''
        INSERT INTO $tableName (crop_system_id, cropping_system, description) 
        VALUES (?, ?, ?)
      ''', [
          system.cropSystemId,
          system.croppingSystem,
          system.description,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<CropSystem>> fetchAll() async {
    final database = await DatabaseService().database;
    final systems = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return systems.map((e) => CropSystem.fromSqfliteDatabase(e)).toList();
  }

  Future<CropSystem?> fetchByCropSystemId(int cropSystemId) async {
    final database = await DatabaseService().database;
    final system = await database.rawQuery('''
      SELECT * FROM $tableName WHERE crop_system_id = ?
    ''', [cropSystemId]);

    return system.isNotEmpty
        ? CropSystem.fromSqfliteDatabase(system.first)
        : null;
  }

  // Add more database methods as needed
}
