import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerPesticidesDB {
  final tableName = 'tblfrfarmerpesticides';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_pesticide_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "farmer_crop_id" INTEGER NOT NULL,
        "pesticide_type_id" INTEGER NOT NULL,
        "others" VARCHAR(255),
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_pesticide_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int farmerCropId,
    required int pesticideTypeId,
    String? others,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, pesticide_type_id, others, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      farmerCropId,
      pesticideTypeId,
      others,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertPesticides(List<FarmerPesticide> pesticides) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var pesticide in pesticides) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, pesticide_type_id, others, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          pesticide.farmerId,
          pesticide.farmerFarmId,
          pesticide.farmerCropId,
          pesticide.pesticideTypeId,
          pesticide.others,
          pesticide.dateCreated.toLocal().toIso8601String(),
          pesticide.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerPesticide>> fetchAll() async {
    final database = await DatabaseService().database;
    final pesticides = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return pesticides
        .map((e) => FarmerPesticide.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerPesticide> fetchByFarmerPesticideId(
      int farmerPesticideId) async {
    final database = await DatabaseService().database;
    final pesticide = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_pesticide_id = ?
    ''', [farmerPesticideId]);

    return FarmerPesticide.fromSqfliteDatabase(pesticide.first);
  }

  // Add more database methods as needed
}
