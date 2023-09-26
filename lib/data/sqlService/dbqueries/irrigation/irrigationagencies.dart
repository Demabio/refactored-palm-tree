import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/irrigation/irrigationagencies.dart';
import '../../database_service.dart';

class IrrigationAgencyDB {
  final tableName = 'tblfrirrigationagencies';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_agency_id" INTEGER NOT NULL,
        "agency_name" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_agency_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String agencyName,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (irrigation_agency_id, agency_name, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      agencyName,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<IrrigationAgency>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationAgencies = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationAgencies
        .map((e) => IrrigationAgency.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IrrigationAgency> fetchByIrrigationAgencyId(
      int irrigationAgencyId) async {
    final database = await DatabaseService().database;
    final irrigationAgency = await database.rawQuery('''
      SELECT * FROM $tableName WHERE irrigation_agency_id = ?
    ''', [irrigationAgencyId]);

    return IrrigationAgency.fromSqfliteDatabase(irrigationAgency.first);
  }

  // Add more database methods as needed
}
