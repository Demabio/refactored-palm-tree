import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationmemberships.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class IrrigationMembershipTypeDB {
  final tableName = 'tblfrirrigationmembershiptype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "membership_type_id" INTEGER NOT NULL,
        "irrigation_membership_type" VARCHAR(255),
        "date_created" DATETIME,
        PRIMARY KEY("membership_type_id")
      );
    """);
  }

  Future<int> createIrrigationMembershipType(
      IrrigationMembershipType membershipType) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        irrigation_membership_type, date_created
      ) VALUES (?, ?)
    ''', [
      membershipType.irrigationMembershipType,
      DateTime.now().toLocal().toIso8601String(),
    ]);
  }

  Future<int> update(IrrigationMembershipType membershipType) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE $tableName SET
        irrigation_membership_type = ?, date_created = ?
      WHERE membership_type_id = ?
    ''', [
      membershipType.irrigationMembershipType,
      DateTime.now().toLocal().toIso8601String(),
      membershipType.membershipTypeId,
    ]);
  }

  Future<int> insertIrrigationMembershipTypes(
      List<IrrigationMembershipType> membershipTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var membershipType in membershipTypes) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            irrigation_membership_type, date_created
          ) VALUES (?, ?)
        ''', [
          membershipType.irrigationMembershipType,
          membershipType.dateCreated?.toIso8601String(),
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<IrrigationMembershipType>> fetchAll() async {
    final database = await DatabaseService().database;
    final membershipTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return membershipTypes
        .map((e) => IrrigationMembershipType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<IrrigationMembershipType> fetchByMembershipTypeId(
      int membershipTypeId) async {
    final database = await DatabaseService().database;
    final membershipType = await database.rawQuery('''
      SELECT * FROM $tableName WHERE membership_type_id = ?
    ''', [membershipTypeId]);

    return IrrigationMembershipType.fromSqfliteDatabase(membershipType.first);
  }

  // Add more database methods as needed
}
