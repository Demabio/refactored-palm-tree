import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_fish_input_id")
      );
    """);
  }

  Future<int> createFarmerFishInput(FarmerFishInput fishInput) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, fish_input_id, date_created, created_by
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
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var fishInput in fishInputs) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, fish_input_id, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          fishInput.farmerId,
          fishInput.farmerFarmId,
          fishInput.fishInputId,
          DateTime.now().toLocal().toIso8601String(),
          fishInput.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFishInput>> fetchAll() async {
    final database = await DatabaseService().database;
    final fishInputs = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fishInputs
        .map((e) => FarmerFishInput.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerFishInput>> fetchAllByFarmer(int id) async {
    final database = await DatabaseService().database;
    final fishInputs = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fishInputs
        .map((e) => FarmerFishInput.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFishInput> fetchByFarmerFishInputId(
      int farmerFishInputId) async {
    final database = await DatabaseService().database;
    final fishInput = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fish_input_id = ?
    ''', [farmerFishInputId]);

    return FarmerFishInput.fromSqfliteDatabase(fishInput.first);
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed
}
