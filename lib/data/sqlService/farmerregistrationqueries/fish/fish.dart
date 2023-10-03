import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFishDB {
  final tableName = 'tblfrfarmerfish';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fish_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "fish_type_id" INTEGER NOT NULL,
        "production_type_id" INTEGER NOT NULL,
        "no_of_fingerlings" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_fish_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int fishTypeId,
    required int productionTypeId,
    required int noOfFingerlings,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, fish_type_id, production_type_id, no_of_fingerlings, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      fishTypeId,
      productionTypeId,
      noOfFingerlings,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFish(List<FarmerFish> fish) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var farmerFish in fish) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, fish_type_id, production_type_id, no_of_fingerlings, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          farmerFish.farmerId,
          farmerFish.farmerFarmId,
          farmerFish.fishTypeId,
          farmerFish.productionTypeId,
          farmerFish.noOfFingerlings,
          farmerFish.dateCreated.toLocal().toIso8601String(),
          farmerFish.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFish>> fetchAll() async {
    final database = await DatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fish.map((e) => FarmerFish.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerFish> fetchByFarmerFishId(int farmerFishId) async {
    final database = await DatabaseService().database;
    final fish = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fish_id = ?
    ''', [farmerFishId]);

    return FarmerFish.fromSqfliteDatabase(fish.first);
  }

  // Add more database methods as needed
}