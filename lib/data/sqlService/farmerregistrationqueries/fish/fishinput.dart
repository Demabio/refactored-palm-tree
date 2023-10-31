import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFishInputDB {
  final tableName = 'tblfarmerfishinput';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fish_input_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "fish_input_id" INTEGER NOT NULL,
        "date_created" DATETIME,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_fish_input_id")
      );
    """);
  }

  Future<int> createFarmerFishInput(FarmerFishInput fishInput) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, fish_input_id, date_created, created_by , active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      fishInput.farmerId,
      fishInput.farmerFarmId,
      fishInput.fishInputId,
      DateTime.now().toLocal().toIso8601String(),
      fishInput.createdBy,
    ]);
  }

  Future<int> update(FarmerFishInput fishInput) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        fishInputId = ? 
      WHERE farmer_fish_input_id = ?
    ''', [
      fishInput.fishInputId,
      fishInput.farmerFishInputId,
    ]);
  }

  Future<int> insertFishInputs(List<FarmerFishInput> fishInputs) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishInput in fishInputs) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, fish_input_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          fishInput.farmerId,
          fishInput.farmerFarmId,
          fishInput.fishInputId,
          DateTime.now().toLocal().toIso8601String(),
          fishInput.createdBy,
          0,
          fishInput.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertFishInputs(List<FarmerFishInput> fishInputs) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishInput in fishInputs) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ? WHERE farmer_farm_id = ? AND fish_input_id = ?
        ''', [
          fishInput.dateCreated?.toLocal().toIso8601String(),
          fishInput.farmerFarmId,
          fishInput.fishInputId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFishInput>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final fishInputs = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return fishInputs
        .map((e) => FarmerFishInput.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerFishInput>> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fishInputs = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fishInputs
        .map((e) => FarmerFishInput.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFishInput> fetchByFarmerFishInputId(
      int farmerFishInputId) async {
    final database = await FarmerDatabaseService().database;
    final fishInput = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fish_input_id = ? AND active = 1
    ''', [farmerFishInputId]);

    return FarmerFishInput.fromSqfliteDatabase(fishInput.first);
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
