import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/householdrelationships.dart';
import '../../database_service.dart';

class HouseholdRelationshipsDB {
  final tableName = 'tblfrhouseholdrlshps';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "hh_rlshp_id" INTEGER NOT NULL,
        "rlshp_to_head" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("hh_rlshp_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String relationshipToHead,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (hh_rlshp_id, rlshp_to_head, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      relationshipToHead,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<HouseholdRelationship>> fetchAll() async {
    final database = await DatabaseService().database;
    final relationships = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return relationships
        .map((e) => HouseholdRelationship.fromSqfliteDatabase(e))
        .toList();
  }

  Future<HouseholdRelationship> fetchByRelationshipId(
      int relationshipId) async {
    final database = await DatabaseService().database;
    final relationship = await database.rawQuery('''
      SELECT * FROM $tableName WHERE hh_rlshp_id = ?
    ''', [relationshipId]);

    return HouseholdRelationship.fromSqfliteDatabase(relationship.first);
  }

  // Add more database methods as needed
}
