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
