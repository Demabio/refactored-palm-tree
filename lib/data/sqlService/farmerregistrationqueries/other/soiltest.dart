import 'package:kiamis_app/data/models/farmerregistrationmodels/other/soiltest.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_soilseed_id")
      );
    """);
  }

  Future<int> create(FarmerSoilTest soilTest) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, soiltest, soil_test_year, 
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      soilTest.farmerId,
      soilTest.farmerFarmId,
      soilTest.soilTest,
      soilTest.soilTestYear,
      DateTime.now().toLocal().toIso8601String(),
      soilTest.createdBy,
    ]);
  }

  Future<int> update(FarmerSoilTest soilTest) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        soiltest = ?
      WHERE farmer_farm_id = ?
    ''', [
      soilTest.soilTest,
      soilTest.farmerFarmId,
    ]);
  }

  Future<int> insertSoilTests(List<FarmerSoilTest> soilTests) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var soilTest in soilTests) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, soiltest, soil_test_year, 
            date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          soilTest.farmerId,
          soilTest.farmerFarmId,
          soilTest.soilTest,
          soilTest.soilTestYear,
          soilTest.dateCreated?.toLocal().toIso8601String(),
          soilTest.createdBy,
          1,
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
    final database = await FarmerDatabaseService().database;
    final soilTests = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return soilTests.map((e) => FarmerSoilTest.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerSoilTest?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final soilTests = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [id]);

    return soilTests.isNotEmpty
        ? FarmerSoilTest.fromSqfliteDatabase(soilTests.first)
        : null;
  }
  // Add more database methods as needed
}
