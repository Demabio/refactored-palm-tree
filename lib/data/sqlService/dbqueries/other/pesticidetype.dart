import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/pesticidetype.dart';
import '../../database_service.dart';

class PesticideTypeDB {
  final tableName = 'tblfrpesticidetype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "pesticide_type_id" INTEGER NOT NULL,
        "pesticide_type" VARCHAR(255) NOT NULL,
        "description" TEXT,
        PRIMARY KEY("pesticide_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String pesticideType,
    String? description,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (pesticide_type_id, pesticide_type, description) 
      VALUES (?, ?, ?)
    ''', [
      id,
      pesticideType,
      description,
    ]);
  }

  Future<List<PesticideType>> fetchAll() async {
    final database = await DatabaseService().database;
    final types = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return types.map((e) => PesticideType.fromSqfliteDatabase(e)).toList();
  }

  Future<PesticideType> fetchByPesticideTypeId(int pesticideTypeId) async {
    final database = await DatabaseService().database;
    final type = await database.rawQuery('''
      SELECT * FROM $tableName WHERE pesticide_type_id = ?
    ''', [pesticideTypeId]);

    return PesticideType.fromSqfliteDatabase(type.first);
  }

  // Add more database methods as needed
}
