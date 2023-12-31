import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "active" INT,
        "enumerator_id" INT,
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
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, age_group_id, no_of_livestock_male, no_of_livestock_female, date_created, created_by, active, enumerator_id
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
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var ageGroup in ageGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, age_group_id, no_of_livestock_male, no_of_livestock_female, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          ageGroup.farmerLivestockId,
          ageGroup.ageGroupId,
          ageGroup.noOfLivestockMale,
          ageGroup.noOfLivestockFemale,
          DateTime.now().toLocal().toIso8601String(),
          ageGroup.createdBy,
          0,
          ageGroup.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertAgeGroups(List<FarmerLivestockAgeGroup> ageGroups) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var ageGroup in ageGroups) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, no_of_livestock_male = ?, no_of_livestock_female = ?, date_created = ? WHERE farmer_livestock_id = ? AND age_group_id = ?
        ''', [
          ageGroup.noOfLivestockMale,
          ageGroup.noOfLivestockFemale,
          ageGroup.dateCreated.toLocal().toIso8601String(),
          ageGroup.farmerLivestockId,
          ageGroup.ageGroupId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_livestock_id = ?
    ''', [id]);
  }

  Future<int> delete2(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_livestock_id = ?
    ''', [id]);
  }

  Future<List<FarmerLivestockAgeGroup>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final ageGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return ageGroups
        .map((e) => FarmerLivestockAgeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerLivestockAgeGroup>> fetchByLive(int id) async {
    final database = await FarmerDatabaseService().database;
    final ageGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ? AND active = 1
    ''', [id]);

    return ageGroups
        .map((e) => FarmerLivestockAgeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerLivestockAgeGroup>> fetchByLiveAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final ageGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ?
    ''', [id]);

    return ageGroups
        .map((e) => FarmerLivestockAgeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerLivestockAgeGroup?> fetchById(int id) async {
    final database = await FarmerDatabaseService().database;
    final ageGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestockagegroup_id = ? AND active = 1
    ''', [id]);

    return ageGroups.isNotEmpty
        ? FarmerLivestockAgeGroup.fromSqfliteDatabase(ageGroups.first)
        : null;
  }

  // Add more database methods as needed
}
