import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerAgriInfoSourceDB {
  final tableName = 'tblfrfarmeragriinforsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_agri_info_source_id" INTEGER NOT NULL,
        "agri_info_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_agri_info_source_id")
      );
    """);
  }

  Future<int> create(FarmerAgriInfoSource agriInfoSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        agri_info_source_id, farmer_id
      ) VALUES (?, ?)
    ''', [
      agriInfoSource.agriInfoSourceId,
      agriInfoSource.farmerId,
    ]);
  }

  Future<int> update(FarmerAgriInfoSource agriInfoSource) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        agri_info_source_id = ? 
      WHERE farmer_agri_info_source_id = ?
    ''', [
      agriInfoSource.agriInfoSourceId,
      agriInfoSource.farmerAgriInfoSourceId,
    ]);
  }

  Future<int> insertAgriInfoSources(
      List<FarmerAgriInfoSource> agriInfoSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var agriInfoSource in agriInfoSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            agri_info_source_id, farmer_id, active, enumerator_id
          ) VALUES (?, ?, ?, ?)
        ''', [
          agriInfoSource.agriInfoSourceId,
          agriInfoSource.farmerId,
          0,
          agriInfoSource.enumeratorId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertAgriInfoSources(
      List<FarmerAgriInfoSource> agriInfoSources) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var agriInfoSource in agriInfoSources) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1 WHERE farmer_id = ? AND agri_info_source_id = ?
        ''', [
          agriInfoSource.farmerId,
          agriInfoSource.agriInfoSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> updateall(int farmerid, int childid) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 1 WHERE farmer_id = ? AND agri_info_source_id = ?
    ''', [
      farmerid,
      childid,
    ]);
  }

  Future<List<FarmerAgriInfoSource>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final agriInfoSources = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = ?
    ''');

    return agriInfoSources
        .map((e) => FarmerAgriInfoSource.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerAgriInfoSource>?> fetchByFarmerId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerAgriInfoSource.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_id = ?
    ''', [id]);
  }

  // Add more database methods as needed
}
