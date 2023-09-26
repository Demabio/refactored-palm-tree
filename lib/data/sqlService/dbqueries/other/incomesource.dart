import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/incomesource.dart';
import '../../database_service.dart';

class IncomeSourceDB {
  final tableName = 'tblfrincomesource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "income_source_id" INTEGER NOT NULL,
        "income_source" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("income_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String incomeSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (income_source_id, income_source, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      incomeSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<IncomeSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final incomeSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return incomeSources
        .map((e) => IncomeSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IncomeSource> fetchByIncomeSourceId(int incomeSourceId) async {
    final database = await DatabaseService().database;
    final incomeSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE income_source_id = ?
    ''', [incomeSourceId]);

    return IncomeSource.fromSqfliteDatabase(incomeSource.first);
  }

  // Add more database methods as needed
}
