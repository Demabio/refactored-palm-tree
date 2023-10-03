import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_fert_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int farmerCropId,
    required int fertiliserTypeId,
    String? compoundName,
    String? basalOthersName,
    String? others,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, fertiliser_type_id, compound_name, basal_others_name, others,
        date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      farmerCropId,
      fertiliserTypeId,
      compoundName,
      basalOthersName,
      others,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertFertilisers(List<FarmerFertiliser> fertilisers) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var fertiliser in fertilisers) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, fertiliser_type_id, compound_name, basal_others_name, others,
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          fertiliser.farmerId,
          fertiliser.farmerFarmId,
          fertiliser.farmerCropId,
          fertiliser.fertiliserTypeId,
          fertiliser.compoundName,
          fertiliser.basalOthersName,
          fertiliser.others,
          fertiliser.dateCreated.toLocal().toIso8601String(),
          fertiliser.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFertiliser>> fetchAll() async {
    final database = await DatabaseService().database;
    final fertilisers = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fertilisers
        .map((e) => FarmerFertiliser.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFertiliser> fetchByFarmerFertiliserId(
      int farmerFertiliserId) async {
    final database = await DatabaseService().database;
    final fertiliser = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fert_id = ?
    ''', [farmerFertiliserId]);

    return FarmerFertiliser.fromSqfliteDatabase(fertiliser.first);
  }

  // Add more database methods as needed
}