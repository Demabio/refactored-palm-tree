import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/farm/farmownership.dart';
import '../../database_service.dart';

class FarmerFarmOwnershipDB {
  final tableName = 'tblfrfarmerfarmownership';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "ownership_id" INTEGER NOT NULL,
        "ownership_desc" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("ownership_id")
      );
    """);
  }

  Future<List<FarmerFarmOwnership>> fetchAll() async {
    final database = await DatabaseService().database;
    final ownerships = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return ownerships
        .map((e) => FarmerFarmOwnership.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFarmOwnership> fetchByOwnershipId(int ownershipId) async {
    final database = await DatabaseService().database;
    final ownership = await database.rawQuery('''
      SELECT * FROM $tableName WHERE ownership_id = ?
    ''', [ownershipId]);

    return FarmerFarmOwnership.fromSqfliteDatabase(ownership.first);
  }
}
