import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/irrigation/irrigationtypes.dart';
import '../../database_service.dart';

class IrrigationTypeDB {
  final tableName = 'tblfrirrigationtypes';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_type_id" INTEGER NOT NULL,
        "irrigation_type" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String irrigationType,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
        INSERT INTO $tableName (irrigation_type_id, irrigation_type, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
      id,
      irrigationType,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationTypes(
      List<IrrigationType> irrigationTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var type in irrigationTypes) {
        batch.rawInsert('''
        INSERT INTO $tableName (irrigation_type_id, irrigation_type, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          type.irrigationTypeId,
          type.irrigationType,
          type.dateCreated.toLocal().toIso8601String(),
          type.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<IrrigationType>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationTypes
        .map((e) => IrrigationType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IrrigationType> fetchByIrrigationTypeId(int irrigationTypeId) async {
    final database = await DatabaseService().database;
    final irrigationType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE irrigation_type_id = ?
    ''', [irrigationTypeId]);

    return IrrigationType.fromSqfliteDatabase(irrigationType.first);
  }

  // Add more database methods as needed
}
