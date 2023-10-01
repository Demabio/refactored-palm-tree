import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var enterprise in enterprises) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_farm_id, enterprise_id, insured, insurance_name, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          enterprise.farmerFarmId,
          enterprise.enterpriseId,
          enterprise.insured,
          enterprise.insuranceName,
          enterprise.dateCreated.toLocal().toIso8601String(),
          enterprise.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerEnterprise>> fetchAll() async {
    final database = await DatabaseService().database;
    final enterprises = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return enterprises
        .map((e) => FarmerEnterprise.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
