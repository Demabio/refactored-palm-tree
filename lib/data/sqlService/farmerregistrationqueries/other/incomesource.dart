import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerIncomeSourceDB {
  final tableName = 'tblfrfarmerincomesource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_income_id" INTEGER NOT NULL,
        "income_source_id" INTEGER NOT NULL,
        "priority_level" INTEGER,
        "farmer_id" INTEGER,
        "other" TEXT,
        PRIMARY KEY("farmer_income_id")
      );
    """);
  }

  Future<int> create(FarmerIncomeSource incomeSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (income_source_id, priority_level, farmer_id, other) 
      VALUES (?, ?, ?, ?)
    ''', [
      incomeSource.incomeSourceId,
      incomeSource.priorityLevel,
      incomeSource.farmerId,
      incomeSource.other,
    ]);
  }

  Future<int> update(FarmerIncomeSource incomeSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        income_source_id = ?, priority_level = ?, other = ?
      WHERE farmer_income_id = ?
    ''', [
      incomeSource.incomeSourceId,
      incomeSource.priorityLevel,
      incomeSource.other,
      incomeSource.farmerIncomeId,
    ]);
  }

  Future<int> insertIncome(List<FarmerIncomeSource> incomeSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var incomeSource in incomeSources) {
        batch.rawInsert('''
            INSERT INTO $tableName (income_source_id, priority_level, farmer_id, other) 
          VALUES (?, ?, ?, ?)
        ''', [
          incomeSource.incomeSourceId,
          incomeSource.priorityLevel,
          incomeSource.farmerId,
          incomeSource.other,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerIncomeSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final farmerIncomeSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerIncomeSources
        .map((e) => FarmerIncomeSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerIncomeSource> fetchByFarmerIncomeId(int farmerIncomeId) async {
    final database = await FarmerDatabaseService().database;
    final farmerIncomeSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_income_id = ?
    ''', [farmerIncomeId]);

    return FarmerIncomeSource.fromSqfliteDatabase(farmerIncomeSource.first);
  }

  Future<List<FarmerIncomeSource>?> fetchByFarmerId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerIncomeSource.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);
  } // Add more database methods as needed
}
