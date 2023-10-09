import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_fert_source_id")
      );
    """);
  }

  Future<int> create(FarmerFertiliserSource fertiliserSource) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, farmer_crop_id, fert_source_id, other_source, distance_source, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      fertiliserSource.farmerId,
      fertiliserSource.farmerFarmId,
      fertiliserSource.farmerCropId,
      fertiliserSource.fertSourceId,
      fertiliserSource.otherSource,
      fertiliserSource.distanceSource,
      DateTime.now().toLocal().toIso8601String(),
      fertiliserSource.createdBy,
    ]);
  }

  Future<int> update(FarmerFertiliserSource fertiliserSource) async {
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var fertiliserSource in fertiliserSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, farmer_crop_id, fert_source_id, other_source, distance_source,
            date_created, created_by
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          fertiliserSource.farmerId,
          fertiliserSource.farmerFarmId,
          fertiliserSource.farmerCropId,
          fertiliserSource.fertSourceId,
          fertiliserSource.otherSource,
          fertiliserSource.distanceSource,
          DateTime.now().toLocal().toIso8601String(),
          fertiliserSource.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerFertiliserSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final fertiliserSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return fertiliserSources
        .map((e) => FarmerFertiliserSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<FarmerFertiliserSource> fetchByFarmerFertiliserSourceId(
      int farmerFertiliserSourceId) async {
    final database = await DatabaseService().database;
    final fertiliserSource = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_fert_source_id = ?
    ''', [farmerFertiliserSourceId]);

    return FarmerFertiliserSource.fromSqfliteDatabase(fertiliserSource.first);
  }

  // Add more database methods as needed
}
