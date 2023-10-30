import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFertiliserSourcesDB {
  final tableName = 'tblfrfarmerfertilisersources';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_fert_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "farmer_crop_id" INTEGER NOT NULL,
        "fert_source_id" INTEGER NOT NULL,
        "other_source" TEXT,
        "distance_source" REAL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_fert_source_id")
      );
    """);
  }

  Future<int> create(FarmerFertiliserSource fertiliserSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, fert_source_id, other_source, distance_source, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      fertiliserSource.farmerId,
      fertiliserSource.farmerFarmId,
      fertiliserSource.farmerCropId,
      fertiliserSource.fertSourceId,
      fertiliserSource.otherSource,
      fertiliserSource.distanceSource,
      DateTime.now().toLocal().toIso8601String(),
      fertiliserSource.createdBy,
      1,
      fertiliserSource.enumeratorId,
    ]);
  }

  Future<int> update(FarmerFertiliserSource fertiliserSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        fert_source_id = ?, other_source = ?, distance_source = ?
      WHERE farmer_fert_source_id = ?
    ''', [
      fertiliserSource.fertSourceId,
      fertiliserSource.otherSource,
      fertiliserSource.distanceSource,
      fertiliserSource.farmerFertSourceId,
    ]);
  }

  Future<int> insertFertiliserSources(
      List<FarmerFertiliserSource> fertiliserSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var fertiliserSource in fertiliserSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, fert_source_id, other_source, distance_source,
            date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          fertiliserSource.farmerId,
          fertiliserSource.farmerFarmId,
          fertiliserSource.farmerCropId,
          fertiliserSource.fertSourceId,
          fertiliserSource.otherSource,
          fertiliserSource.distanceSource,
          DateTime.now().toLocal().toIso8601String(),
          fertiliserSource.createdBy,
          0,
          fertiliserSource.createdBy,
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
    UPDATE $tableName SET active = 1 WHERE farmer_crop_id = ? AND fert_source_id = ?
    ''', [
      farmerCropId,
      childid,
    ]);
  }

  Future<List<FarmerFertiliserSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final fertiliserSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fertiliserSources
        .map((e) => FarmerFertiliserSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFertiliserSource> fetchByFarmerFertiliserSourceId(
      int farmerFertiliserSourceId) async {
    final database = await FarmerDatabaseService().database;
    final fertiliserSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fert_source_id = ?
    ''', [farmerFertiliserSourceId]);

    return FarmerFertiliserSource.fromSqfliteDatabase(fertiliserSource.first);
  }

  Future<List<FarmerFertiliserSource>?> fetchByCropId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_crop_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerFertiliserSource.fromSqfliteDatabase(e))
            .toList()
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
