import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIrrigationAgencyDB {
  final tableName = 'tblfrfarmersirrigationagencies';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "irrigation_crop_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "irrigation_agency_id" INTEGER NOT NULL,
        "agency_name" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("irrigation_crop_id")
      );
    """);
  }

  Future<int> create(FarmerIrrigationAgency irrigationAgency) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, irrigation_agency_id, agency_name, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      irrigationAgency.farmerId,
      irrigationAgency.farmerFarmId,
      irrigationAgency.irrigationAgencyId,
      irrigationAgency.agencyName,
      DateTime.now().toLocal().toIso8601String(),
      irrigationAgency.createdBy,
    ]);
  }

  Future<int> update(FarmerIrrigationAgency irrigationAgency) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        irrigation_agency_id = ?, agency_name = ? 
      WHERE irrigation_crop_id = ?
    ''', [
      irrigationAgency.irrigationAgencyId,
      irrigationAgency.agencyName,
      irrigationAgency.irrigationCropId,
    ]);
  }

  Future<int> insertIrrigationAgencies(
      List<FarmerIrrigationAgency> irrigationAgencies) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var irrigationAgency in irrigationAgencies) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, irrigation_agency_id, agency_name, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          irrigationAgency.farmerId,
          irrigationAgency.farmerFarmId,
          irrigationAgency.irrigationAgencyId,
          irrigationAgency.agencyName,
          DateTime.now().toLocal().toIso8601String(),
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
    final database = await FarmerDatabaseService().database;
    final irrigationAgencies = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return irrigationAgencies
        .map((e) => FarmerIrrigationAgency.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerIrrigationAgency>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerIrrigationAgency.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
