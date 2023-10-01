import 'package:kiamis_app/data/models/farmerregistrationmodels/other/campchange.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerCampChangeDB {
  final tableName = 'tblfrfarmerscampchange';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "old_agri_camp_id" INTEGER NOT NULL,
        "season_id" INTEGER NOT NULL,
        "new_agri_camp_id" INTEGER NOT NULL,
        "approved_by" VARCHAR(255) NOT NULL,
        "date_approved" DATETIME NOT NULL,
        PRIMARY KEY("id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int oldAgriCampId,
    required int seasonId,
    required int newAgriCampId,
    required String approvedBy,
    required DateTime dateApproved,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, old_agri_camp_id, season_id, new_agri_camp_id, approved_by, date_approved
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      oldAgriCampId,
      seasonId,
      newAgriCampId,
      approvedBy,
      dateApproved.toLocal().toIso8601String(),
    ]);
  }

  Future<int> insertCampChanges(List<FarmerCampChange> campChanges) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var campChange in campChanges) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, old_agri_camp_id, season_id, new_agri_camp_id, approved_by, date_approved
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          campChange.farmerId,
          campChange.oldAgriCampId,
          campChange.seasonId,
          campChange.newAgriCampId,
          campChange.approvedBy,
          campChange.dateApproved?.toLocal().toIso8601String(),
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerCampChange>> fetchAll() async {
    final database = await DatabaseService().database;
    final campChanges = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return campChanges
        .map((e) => FarmerCampChange.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
