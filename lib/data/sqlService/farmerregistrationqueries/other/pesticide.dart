import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_pesticide_id")
      );
    """);
  }

  Future<int> create(FarmerPesticide pesticide) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, pesticide_type_id, others, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      pesticide.farmerId,
      pesticide.farmerFarmId,
      pesticide.farmerCropId,
      pesticide.pesticideTypeId,
      pesticide.others,
      DateTime.now().toLocal().toIso8601String(),
      pesticide.createdBy,
    ]);
  }

  Future<int> update(FarmerPesticide pesticide) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        pesticide_type_id = ?, others = ? 
      WHERE farmer_pesticide_id = ?
    ''', [
      pesticide.pesticideTypeId,
      pesticide.others,
    ]);
  }

  Future<int> insertPesticides(List<FarmerPesticide> pesticides) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var pesticide in pesticides) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, pesticide_type_id, others, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          pesticide.farmerId,
          pesticide.farmerFarmId,
          pesticide.farmerCropId,
          pesticide.pesticideTypeId,
          pesticide.others,
          DateTime.now().toLocal().toIso8601String(),
          pesticide.createdBy,
          0,
          pesticide.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertPesticides(List<FarmerPesticide> pesticides) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var pesticide in pesticides) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, others = ?,  date_created = ? WHERE farmer_crop_id = ? AND pesticide_type_id = ?
        ''', [
          pesticide.others,
          pesticide.dateCreated?.toLocal().toIso8601String(),
          pesticide.farmerCropId,
          pesticide.pesticideTypeId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerPesticide>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final pesticides = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return pesticides
        .map((e) => FarmerPesticide.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerPesticide> fetchByFarmerPesticideId(
      int farmerPesticideId) async {
    final database = await FarmerDatabaseService().database;
    final pesticide = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_pesticide_id = ? AND active = 1
    ''', [farmerPesticideId]);

    return FarmerPesticide.fromSqfliteDatabase(pesticide.first);
  }

  Future<List<FarmerPesticide>?> fetchByCropId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_crop_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerPesticide.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<List<FarmerPesticide>?> fetchByCropIdAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_crop_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerPesticide.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_crop_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
