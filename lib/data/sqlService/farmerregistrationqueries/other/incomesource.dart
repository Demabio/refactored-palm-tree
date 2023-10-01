import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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

  Future<int> create({
    required int incomeSourceId,
    int? priorityLevel,
    int? farmerId,
    String? other,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (income_source_id, priority_level, farmer_id, other) 
      VALUES (?, ?, ?, ?)
    ''', [
      incomeSourceId,
      priorityLevel,
      farmerId,
      other,
    ]);
  }

  Future<List<FarmerIncomeSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerIncomeSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerIncomeSources
        .map((e) => FarmerIncomeSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerIncomeSource> fetchByFarmerIncomeId(int farmerIncomeId) async {
    final database = await DatabaseService().database;
    final farmerIncomeSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_income_id = ?
    ''', [farmerIncomeId]);

    return FarmerIncomeSource.fromSqfliteDatabase(farmerIncomeSource.first);
  }

  // Add more database methods as needed
}
