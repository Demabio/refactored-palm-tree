import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerEnterprisesDB {
  final tableName = 'tblfrfarmerenterprises';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_enterprise_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "enterprise_id" INTEGER NOT NULL,
        "insured" BOOLEAN NOT NULL,
        "insurance_name" VARCHAR(255),
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_enterprise_id")
      );
    """);
  }

  Future<int> create({
    required int farmerFarmId,
    required int enterpriseId,
    required bool insured,
    String? insuranceName,
    String? createdBy,
  }) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_farm_id, enterprise_id, insured, insurance_name, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerFarmId,
      enterpriseId,
      insured ? 1 : 0,
      insuranceName,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertEnterprises(List<FarmerEnterprise> enterprises) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var enterprise in enterprises) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_farm_id, enterprise_id, insured,  date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          enterprise.farmerFarmId,
          enterprise.enterpriseId,
          enterprise.insured,
          enterprise.dateCreated?.toLocal().toIso8601String(),
          enterprise.createdBy,
          0,
          enterprise.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertEnterprises(List<FarmerEnterprise> enterprises) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var enterprise in enterprises) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ? WHERE farmer_farm_id = ? AND enterprise_id = ?
        ''', [
          enterprise.dateCreated?.toLocal().toIso8601String(),
          enterprise.farmerFarmId,
          enterprise.enterpriseId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> delete(int farmerEnterprise) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [farmerEnterprise]);
  }

  Future<int> delete2(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_livestock_id = ?
    ''', [id]);
  }

  Future<int> updateall(int farmerEnterprise, int childid) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 1 WHERE farmer_farm_id = ? AND enterprise_id = ?
    ''', [
      farmerEnterprise,
      childid,
    ]);
  }

  Future<List<FarmerEnterprise>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final enterprises = await database.rawQuery(''' 
      SELECT * FROM $tableName AND active = 1
    ''');

    return enterprises
        .map((e) => FarmerEnterprise.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerEnterprise>> fetchAllByFarmId(int id) async {
    final database = await FarmerDatabaseService().database;
    final enterprises = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [id]);

    return enterprises
        .map((e) => FarmerEnterprise.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
