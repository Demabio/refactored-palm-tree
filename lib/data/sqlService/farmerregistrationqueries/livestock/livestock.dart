import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockDB {
  final tableName = 'tblfrfarmerslivestock';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestock_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "livestock_farmsystem_cat_id" INTEGER NOT NULL,
        "livestock_id" INTEGER NOT NULL,
        "no_of_beehives" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("farmer_livestock_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int livestockFarmSystemCategoryId,
    required int livestockId,
    required int noOfBeehives,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, livestock_farmsystem_cat_id, livestock_id,
        no_of_beehives, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      livestockFarmSystemCategoryId,
      livestockId,
      noOfBeehives,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertLivestock(List<FarmerLivestock> livestockList) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var livestock in livestockList) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, livestock_farmsystem_cat_id, livestock_id,
            no_of_beehives, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          livestock.farmerId,
          livestock.farmerFarmId,
          livestock.livestockFarmsystemCatId,
          livestock.livestockId,
          livestock.noOfBeehives,
          livestock.dateCreated.toLocal().toIso8601String(),
          livestock.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestock>> fetchAll() async {
    final database = await DatabaseService().database;
    final livestockList = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return livestockList
        .map((e) => FarmerLivestock.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
