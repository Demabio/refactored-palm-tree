import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmertypes.dart';
import '../../database_service.dart';

class FarmerTypeDB {
  final tableName = 'tblfrfarmerstype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_type_id" INTEGER NOT NULL,
        "farmer_type" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_type_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String farmerType,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (farmer_type_id, farmer_type, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      farmerType,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<FarmerType>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerTypes.map((e) => FarmerType.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerType> fetchByFarmerTypeId(int farmerTypeId) async {
    final database = await DatabaseService().database;
    final farmerType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_type_id = ?
    ''', [farmerTypeId]);

    return FarmerType.fromSqfliteDatabase(farmerType.first);
  }

  // Add more database methods as needed
}
