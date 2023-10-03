import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationAgencyDB {
  final tableName = 'tblfrfarmersirrigationagencies';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "irrigation_agency_id" INTEGER NOT NULL,
        "agency_name" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int irrigationAgencyId,
    required String agencyName,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, irrigation_agency_id, agency_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerId,
      irrigationAgencyId,
      agencyName,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertIrrigationAgencies(
      List<FarmerIrrigationAgency> irrigationAgencies) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationAgency in irrigationAgencies) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, irrigation_agency_id, agency_name, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          irrigationAgency.farmerId,
          irrigationAgency.irrigationAgencyId,
          irrigationAgency.agencyName,
          irrigationAgency.dateCreated.toLocal().toIso8601String(),
          irrigationAgency.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIrrigationAgency>> fetchAll() async {
    final database = await DatabaseService().database;
    final irrigationAgencies = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationAgencies
        .map((e) => FarmerIrrigationAgency.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}