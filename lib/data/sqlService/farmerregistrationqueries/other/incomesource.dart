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
        "active" INT,
        "enumerator_id" INT,
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
        print(incomeSource.priorityLevel);
        batch.rawInsert('''
            INSERT INTO $tableName (income_source_id, priority_level, farmer_id, other, active, enumerator_id) 
          VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          incomeSource.incomeSourceId,
          incomeSource.priorityLevel,
          incomeSource.farmerId,
          incomeSource.other,
          0,
          incomeSource.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertIncome(List<FarmerIncomeSource> incomeSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var incomeSource in incomeSources) {
        print(incomeSource.priorityLevel);

        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, priority_level = ?, other = ? WHERE farmer_id = ? AND income_source_id = ?
        ''', [
          incomeSource.priorityLevel,
          incomeSource.other,
          incomeSource.farmerId,
          incomeSource.incomeSourceId,
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
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return farmerIncomeSources
        .map((e) => FarmerIncomeSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerIncomeSource> fetchByFarmerIncomeId(int farmerIncomeId) async {
    final database = await FarmerDatabaseService().database;
    final farmerIncomeSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_income_id = ? AND active = 1
    ''', [farmerIncomeId]);

    return FarmerIncomeSource.fromSqfliteDatabase(farmerIncomeSource.first);
  }

  Future<List<FarmerIncomeSource>?> fetchByFarmerId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerIncomeSource.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<List<FarmerIncomeSource>?> fetchByFarmerIdAll(int id) async {
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
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_id = ?
    ''', [id]);
  } // Add more database methods as needed
}
