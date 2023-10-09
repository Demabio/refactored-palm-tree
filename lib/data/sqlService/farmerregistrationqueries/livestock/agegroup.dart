import 'package:flutter/widgets.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockAgeGroupsDB {
  final tableName = 'tblfrfarmerlivestockagegroups';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestockagegroup_id" INTEGER NOT NULL,
        "farmer_livestock_id" INTEGER NOT NULL,
        "age_group_id" INTEGER NOT NULL,
        "no_of_livestock_male" INTEGER,
        "no_of_livestock_female" INTEGER,
        "date_created" DATETIME,
        "created_by" INT,
        PRIMARY KEY("farmer_livestockagegroup_id")
      );
    """);
  }

  Future<int> create({
    required int farmerLivestockId,
    required int ageGroupId,
    int? noOfLivestockMale,
    int? noOfLivestockFemale,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, age_group_id, no_of_livestock_male, no_of_livestock_female, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerLivestockId,
      ageGroupId,
      noOfLivestockMale,
      noOfLivestockFemale,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertAgeGroups(List<FarmerLivestockAgeGroup> ageGroups) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var ageGroup in ageGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, age_group_id, no_of_livestock_male, no_of_livestock_female, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          ageGroup.farmerLivestockId,
          ageGroup.ageGroupId,
          ageGroup.noOfLivestockMale,
          ageGroup.noOfLivestockFemale,
          DateTime.now().toLocal().toIso8601String(),
          ageGroup.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> delete({required int id}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
    DELETE FROM $tableName WHERE farmer_livestock_id = ?
    ''', [id]);
  }

  Future<List<FarmerLivestockAgeGroup>> fetchAll() async {
    final database = await DatabaseService().database;
    final ageGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return ageGroups
        .map((e) => FarmerLivestockAgeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
