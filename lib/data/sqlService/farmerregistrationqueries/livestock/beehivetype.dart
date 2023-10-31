import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerLivestockBeehiveTypeDB {
  final tableName = 'tblfrfarmerlivesstockbeehivetype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "beehives_farmer_id" INTEGER NOT NULL,
        "farmer_livestock_id" INTEGER NOT NULL,
        "beehives_type_id" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("beehives_farmer_id")
      );
    """);
  }

  Future<int> create({
    required int farmerLivestockId,
    required int beehivesTypeId,
    String? createdBy,
  }) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, beehives_type_id, date_created, created_by, active, enumerator_id
      ) VALUES (?, ?, ?, ?)
    ''', [
      farmerLivestockId,
      beehivesTypeId,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertBeehiveTypes(
      List<FarmerLivestockBeehiveType> beehiveTypes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var beehiveType in beehiveTypes) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, beehives_type_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?)
        ''', [
          beehiveType.farmerLivestockId,
          beehiveType.beehivesTypeId,
          beehiveType.dateCreated.toLocal().toIso8601String(),
          beehiveType.createdBy,
          0,
          beehiveType.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertBeehiveTypes(
      List<FarmerLivestockBeehiveType> beehiveTypes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var beehiveType in beehiveTypes) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1,  date_created = ? WHERE farmer_livestock_id = ? AND beehives_type_id = ?
        ''', [
          beehiveType.dateCreated.toLocal().toIso8601String(),
          beehiveType.farmerLivestockId,
          beehiveType.beehivesTypeId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockBeehiveType>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final beehiveTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return beehiveTypes
        .map((e) => FarmerLivestockBeehiveType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_livestock_id = ? 
    ''', [id]);
  }

  Future<List<FarmerLivestockBeehiveType>> fetchAllByLivestock(int id) async {
    final database = await FarmerDatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ?  AND active = 1
    ''', [id]);

    return feeds
        .map((e) => FarmerLivestockBeehiveType.fromSqfliteDatabase(e))
        .toList();
  }
  // Add more database methods as needed
}
