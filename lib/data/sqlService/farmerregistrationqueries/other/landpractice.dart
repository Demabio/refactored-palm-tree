import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLandPracticesDB {
  final tableName = 'tblfrfarmerlandpractices';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_practice_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "land_practice_id" INTEGER NOT NULL,
        "quantity" REAL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_practice_id")
      );
    """);
  }

  Future<int> create(FarmerLandPractice farmerLandPractice) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, land_practice_id, quantity, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerLandPractice.farmerId,
      farmerLandPractice.farmerFarmId,
      farmerLandPractice.landPracticeId,
      farmerLandPractice.quantity,
      DateTime.now().toLocal().toIso8601String(),
      farmerLandPractice.createdBy,
    ]);
  }

  Future<int> update(FarmerLandPractice farmerLandPractice) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        land_practice_id = ?, quantity = ? 
      WHERE farmer_practice_id = ?
    ''', [
      farmerLandPractice.landPracticeId,
      farmerLandPractice.quantity,
      farmerLandPractice.landPracticeId,
    ]);
  }

  Future<int> insertLandPractices(
      List<FarmerLandPractice> landPractices) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var landPractice in landPractices) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, land_practice_id, quantity, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          landPractice.farmerId,
          landPractice.farmerFarmId,
          landPractice.landPracticeId,
          landPractice.quantity,
          landPractice.dateCreated?.toLocal().toIso8601String(),
          landPractice.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLandPractice>> fetchAll() async {
    final database = await DatabaseService().database;
    final landPractices = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return landPractices
        .map((e) => FarmerLandPractice.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerLandPractice>?> fetchByFarmerId(int id) async {
    final database = await DatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerLandPractice.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed
}
