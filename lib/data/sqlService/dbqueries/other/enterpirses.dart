import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/enterpirses.dart';
import '../../database_service.dart';

class EnterprisesDB {
  final tableName = 'tblfrenterprises';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "enterprise_id" INTEGER NOT NULL,
        "enterprise_desc" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("enterprise_id")
      );
    """);
  }

  Future<List<Enterprise>> fetchAll() async {
    final database = await DatabaseService().database;
    final enterprises = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return enterprises.map((e) => Enterprise.fromSqfliteDatabase(e)).toList();
  }

  Future<int> create({
    required int id,
    required String enterpriseDesc,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (enterprise_id, enterprise_desc, date_created, created_by) 
      VALUES (?, ?, ?, ?)
    ''', [
      id,
      enterpriseDesc,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertEnterprises(List<Enterprise> enterprises) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var enterprise in enterprises) {
        batch.rawInsert('''
        INSERT INTO $tableName (enterprise_id, enterprise_desc, date_created, created_by) 
        VALUES (?, ?, ?, ?)
      ''', [
          enterprise.enterpriseId,
          enterprise.enterpriseDesc,
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

  Future<Enterprise> fetchByEnterpriseId(int enterpriseId) async {
    final database = await DatabaseService().database;
    final enterprise = await database.rawQuery('''
      SELECT * FROM $tableName WHERE enterprise_id = ?
    ''', [enterpriseId]);

    return Enterprise.fromSqfliteDatabase(enterprise.first);
  }
}
