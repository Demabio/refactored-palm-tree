import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerAgriInfoSourceDB {
  final tableName = 'tblfrfarmeragriinforsource';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_agri_info_source_id" INTEGER NOT NULL,
        "agri_info_source_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        PRIMARY KEY("farmer_agri_info_source_id")
      );
    """);
  }

  Future<int> create(FarmerAgriInfoSource agriInfoSource) async {
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var agriInfoSource in agriInfoSources) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            agri_info_source_id, farmer_id
          ) VALUES (?, ?)
        ''', [
          agriInfoSource.agriInfoSourceId,
          agriInfoSource.farmerId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerAgriInfoSource>> fetchAll() async {
    final database = await DatabaseService().database;
    final agriInfoSources = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return agriInfoSources
        .map((e) => FarmerAgriInfoSource.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
