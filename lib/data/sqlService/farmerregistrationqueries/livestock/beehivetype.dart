import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("beehives_farmer_id")
      );
    """);
  }

  Future<int> create({
    required int farmerLivestockId,
    required int beehivesTypeId,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_livestock_id, beehives_type_id, date_created, created_by
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var beehiveType in beehiveTypes) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_livestock_id, beehives_type_id, date_created, created_by
          ) VALUES (?, ?, ?, ?)
        ''', [
          beehiveType.farmerLivestockId,
          beehiveType.beehivesTypeId,
          beehiveType.dateCreated.toLocal().toIso8601String(),
          beehiveType.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerLivestockBeehiveType>> fetchAll() async {
    final database = await DatabaseService().database;
    final beehiveTypes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return beehiveTypes
        .map((e) => FarmerLivestockBeehiveType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
    DELETE FROM $tableName WHERE farmer_livestock_id = ?
    ''', [id]);
  }

  Future<List<FarmerLivestockBeehiveType>> fetchAllByLivestock(int id) async {
    final database = await DatabaseService().database;
    final feeds = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_livestock_id = ?
    ''', [id]);

    return feeds
        .map((e) => FarmerLivestockBeehiveType.fromSqfliteDatabase(e))
        .toList();
  }
  // Add more database methods as needed
}
