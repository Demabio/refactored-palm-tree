import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestocksystem.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockFarmSystemDB {
  final tableName = 'tblfrfarmerslivestockfarmsystem';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_livestock_farmsystem_id" INTEGER ,
        "farmer_id" INTEGER NOT NULL,
        "livestock_farmsystem_cat_id" INTEGER ,
        "date_created" DATETIME,
        "created_by" VARCHAR(255) ,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_livestock_farmsystem_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int livestockFarmSystemCategoryId,
    required DateTime dateCreated,
    required String createdBy,
  }) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, livestock_farmsystem_cat_id, date_created, created_by
      ) VALUES (?, ?, ?, ?)
    ''', [
      farmerId,
      livestockFarmSystemCategoryId,
      dateCreated.toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFarmSystems(
      List<FarmerLivestockFarmSystem> farmSystems) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var farmSystem in farmSystems) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, livestock_farmsystem_cat_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          farmSystem.farmerId,
          farmSystem.livestockFarmSystemCatId,
          DateTime.now().toLocal().toIso8601String(),
          farmSystem.createdBy,
          1,
          farmSystem.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockFarmSystem>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final farmSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmSystems
        .map((e) => FarmerLivestockFarmSystem.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
