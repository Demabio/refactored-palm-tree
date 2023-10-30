import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFertiliserDB {
  final tableName = 'tblfrfarmerfertiliser';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fert_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "farmer_crop_id" INTEGER NOT NULL,
        "fertiliser_type_id" INTEGER NOT NULL,
        "compound_name" VARCHAR(255),
        "basal_others_name" VARCHAR(255),
        "others" VARCHAR(255),
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_fert_id")
      );
    """);
  }

  Future<int> createFarmerFertiliser(FarmerFertiliser fertiliser) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, fertiliser_type_id, compound_name, basal_others_name, others,
        date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      fertiliser.farmerId,
      fertiliser.farmerFarmId,
      fertiliser.farmerCropId,
      fertiliser.fertiliserTypeId,
      fertiliser.compoundName,
      fertiliser.basalOthersName,
      fertiliser.others,
      DateTime.now().toLocal().toIso8601String(),
      fertiliser.createdBy,
    ]);
  }

  Future<int> update(FarmerFertiliser fertiliser) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        fertiliser_type_id = ?, compound_name = ?, basal_others_name = ?, others = ?
      WHERE farmer_fert_id = ?
    ''', [
      fertiliser.fertiliserTypeId,
      fertiliser.compoundName,
      fertiliser.basalOthersName,
      fertiliser.others,
      fertiliser.farmerFertId,
    ]);
  }

  Future<int> insertFertilisers(List<FarmerFertiliser> fertilisers) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fertiliser in fertilisers) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, fertiliser_type_id, compound_name, basal_others_name, others,
            date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          fertiliser.farmerId,
          fertiliser.farmerFarmId,
          fertiliser.farmerCropId,
          fertiliser.fertiliserTypeId,
          fertiliser.compoundName,
          fertiliser.basalOthersName,
          fertiliser.others,
          DateTime.now().toLocal().toIso8601String(),
          fertiliser.createdBy,
          0,
          fertiliser.createdBy,
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

  Future<List<FarmerFertiliser>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final fertilisers = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fertilisers
        .map((e) => FarmerFertiliser.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFertiliser> fetchByFarmerFertiliserId(
      int farmerFertiliserId) async {
    final database = await FarmerDatabaseService().database;
    final fertiliser = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fert_id = ?
    ''', [farmerFertiliserId]);

    return FarmerFertiliser.fromSqfliteDatabase(fertiliser.first);
  }

  Future<List<FarmerFertiliser>?> fetchByCropId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_crop_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerFertiliser.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_crop_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed
}
