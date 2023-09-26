import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/creditsource.dart';
import '../../database_service.dart';

class CreditSourceDB {
  final tableName = 'tblfrcreditsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "credit_source_id" INTEGER NOT NULL,
        "credit_source" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("credit_source_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String creditSource,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (credit_source_id, credit_source, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      creditSource,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<CreditSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final sources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return sources.map((e) => CreditSource.fromSqfliteDatabase(e)).toList();
  }

  Future<CreditSource> fetchByCreditSourceId(int creditSourceId) async {
    final database = await DatabaseService().database;
    final source = await database.rawQuery('''
      SELECT * FROM $tableName WHERE credit_source_id = ?
    ''', [creditSourceId]);

    return CreditSource.fromSqfliteDatabase(source.first);
  }
}
