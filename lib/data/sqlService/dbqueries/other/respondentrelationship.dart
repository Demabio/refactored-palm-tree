import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/other/respondentrelationship.dart';
import '../../database_service.dart';

class RespondentRelationshipDB {
  final tableName = 'tblfrrespondentrlship';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "respondend_rlshp_id" INTEGER NOT NULL,
        "rlshp_to_farmer" VARCHAR(255) NOT NULL,
        "description" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("respondend_rlshp_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String relationshipToFarmer,
    String? description,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (respondend_rlshp_id, rlshp_to_farmer, description, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      relationshipToFarmer,
      description,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<RespondentRelationship>> fetchAll() async {
    final database = await DatabaseService().database;
    final relationships = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return relationships
        .map((e) => RespondentRelationship.fromSqfliteDatabase(e))
        .toList();
  }

  Future<RespondentRelationship> fetchByRespondentRelationshipId(
      int respondentRelationshipId) async {
    final database = await DatabaseService().database;
    final relationship = await database.rawQuery('''
      SELECT * FROM $tableName WHERE respondend_rlshp_id = ?
    ''', [respondentRelationshipId]);

    return RespondentRelationship.fromSqfliteDatabase(relationship.first);
  }

  // Add more database methods as needed
}
