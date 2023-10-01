import 'package:kiamis_app/data/models/farmerregistrationmodels/other/soiltest.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerSoilTestDB {
  final tableName = 'tblfrfarmersoiltest';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_soilseed_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "soiltest" TEXT NOT NULL,
        "soil_test_year" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_soilseed_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required String soilTest,
    required int soilTestYear,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, soiltest, soil_test_year, 
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      soilTest,
      soilTestYear,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertSoilTests(List<FarmerSoilTest> soilTests) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var soilTest in soilTests) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, soiltest, soil_test_year, 
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          soilTest.farmerId,
          soilTest.farmerFarmId,
          soilTest.soilTest,
          soilTest.soilTestYear,
          soilTest.dateCreated.toLocal().toIso8601String(),
          soilTest.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerSoilTest>> fetchAll() async {
    final database = await DatabaseService().database;
    final soilTests = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return soilTests.map((e) => FarmerSoilTest.fromSqfliteDatabase(e)).toList();
  }

  // Add more database methods as needed
}
