import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerCreditServiceDB {
  final tableName = 'tblfrfarmerscreditservices';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_creditservice_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "credit_source_id" INTEGER NOT NULL,
        "sacco_name" VARCHAR(255),
        "mfintitution_name" VARCHAR(255),
        "others_name" VARCHAR(255),
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_creditservice_id")
      );
    """);
  }

  Future<int> create(FarmerCreditService creditService) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, credit_source_id, sacco_name, mfintitution_name, others_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      creditService.farmerId,
      creditService.creditSourceId,
      creditService.saccoName,
      creditService.mfInstitutionName,
      creditService.othersName,
      DateTime.now().toLocal().toIso8601String(),
      creditService.createdBy,
    ]);
  }

  Future<int> update(FarmerCreditService creditService) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        credit_source_id = ?, sacco_name = ?, mfintitution_name = ?, others_name = ?
      WHERE farmer_creditservice_id = ?
    ''', [
      creditService.creditSourceId,
      creditService.saccoName,
      creditService.mfInstitutionName,
      creditService.othersName,
      creditService.farmerCreditServiceId,
    ]);
  }

  Future<int> insertCreditServices(
      List<FarmerCreditService> creditServices) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var creditService in creditServices) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, credit_source_id, sacco_name, mfintitution_name, others_name, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          creditService.farmerId,
          creditService.creditSourceId,
          creditService.saccoName,
          creditService.mfInstitutionName,
          creditService.othersName,
          DateTime.now().toLocal().toIso8601String(),
          creditService.createdBy,
          1,
          creditService.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerCreditService>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final creditServices = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return creditServices
        .map((e) => FarmerCreditService.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerCreditService>?> fetchByFarmerId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerCreditService.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
