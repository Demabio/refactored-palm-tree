import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "active" INT,
        "enumerator_id" INT,
        "other" VARCHAR(100),
        PRIMARY KEY("farmer_fish_id")
      );
    """);
  }

  Future<int> create(FarmerFish farmerFish) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, fish_type_id, production_type_id, no_of_fingerlings, date_created, created_by , active, enumerator_id, other
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerFish.farmerId,
      farmerFish.farmerFarmId,
      farmerFish.fishTypeId,
      farmerFish.productionTypeId,
      farmerFish.noOfFingerlings,
      DateTime.now().toLocal().toIso8601String(),
      farmerFish.createdBy,
      1,
      farmerFish.enumeratorId,
      farmerFish.other,
    ]);
  }

  Future<int> update(FarmerFish farmerFish) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        fish_type_id = ?, production_type_id = ?, no_of_fingerlings = ?, other = ?
      WHERE farmer_fish_id = ?
    ''', [
      farmerFish.fishTypeId,
      farmerFish.productionTypeId,
      farmerFish.noOfFingerlings,
      farmerFish.other,
      farmerFish.farmerFishId,
    ]);
  }

  Future<int> insertFish(List<FarmerFish> fish) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var farmerFish in fish) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, fish_type_id, production_type_id, no_of_fingerlings, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          farmerFish.farmerId,
          farmerFish.farmerFarmId,
          farmerFish.fishTypeId,
          farmerFish.productionTypeId,
          farmerFish.noOfFingerlings,
          farmerFish.dateCreated?.toLocal().toIso8601String(),
          farmerFish.createdBy,
          1,
          farmerFish.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> updateall(int farmerCropId, int childid) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 1 WHERE farmer_crop_id = ? AND fertiliser_type_id = ?
    ''', [
      farmerCropId,
      childid,
    ]);
  }

  Future<List<FarmerFish>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return fish.map((e) => FarmerFish.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerFish> fetchByFarmerFishId(int farmerFishId) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fish_id = ? AND active = 1
    ''', [farmerFishId]);

    return FarmerFish.fromSqfliteDatabase(fish.first);
  }

  Future<List<FarmerFish>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerFish.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }

  Future<FarmerFish?> fetchById(int id) async {
    final database = await FarmerDatabaseService().database;
    final productionSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_fish_id = ? AND active = 1
    ''', [
      id,
    ]);

    return productionSystems.isNotEmpty
        ? FarmerFish.fromSqfliteDatabase(productionSystems.first)
        : null;
  }
  // Add more database methods as needed
}
