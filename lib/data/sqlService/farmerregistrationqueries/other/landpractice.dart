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

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int landPracticeId,
    double? quantity,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, land_practice_id, quantity, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      landPracticeId,
      quantity,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
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
          landPractice.dateCreated.toLocal().toIso8601String(),
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

  // Add more database methods as needed
}
