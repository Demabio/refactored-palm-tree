import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmerstatus.dart';
import '../../database_service.dart';

class FarmerStatusDB {
  final tableName = 'tblfrfarmerstatus';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_status_id" INTEGER NOT NULL,
        "farmer_status" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_status_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String farmerStatus,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (farmer_status_id, farmer_status, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      farmerStatus,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<FarmerStatus>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerStatuses = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerStatuses
        .map((e) => FarmerStatus.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerStatus> fetchByFarmerStatusId(int farmerStatusId) async {
    final database = await DatabaseService().database;
    final farmerStatus = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_status_id = ?
    ''', [farmerStatusId]);

    return FarmerStatus.fromSqfliteDatabase(farmerStatus.first);
  }

  // Add more database methods as needed
}
