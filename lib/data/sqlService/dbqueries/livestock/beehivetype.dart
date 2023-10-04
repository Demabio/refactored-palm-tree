import 'package:kiamis_app/data/models/dbModels/livestock/beehivetypes.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class LivestockBeehiveTypeDB {
  final tableName = 'tblfrlivestockbeehivetype';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "beehives_type_id" INTEGER NOT NULL,
        "bee_hive_type" VARCHAR(255) NOT NULL,
        PRIMARY KEY("beehives_type_id")
      );
    """);
  }

  Future<int> create({
    required String beeHiveType,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (bee_hive_type) 
      VALUES (?)
    ''', [beeHiveType]);
  }

  Future<int> insertBeehiveTypes(
      List<LivestockBeehiveType> beehiveTypes) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var beehiveType in beehiveTypes) {
        batch.rawInsert('''
          INSERT INTO $tableName (beehives_type_id, bee_hive_type) 
          VALUES (?, ?)
        ''', [
          beehiveType.beehiveTypeId,
          beehiveType.beehiveType,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<LivestockBeehiveType>> fetchAll() async {
    final database = await DatabaseService().database;
    final beehiveTypes = await database.rawQuery('SELECT * FROM $tableName');
    return beehiveTypes
        .map((e) => LivestockBeehiveType.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockBeehiveType> fetchByBeehiveTypeId(int beehiveTypeId) async {
    final database = await DatabaseService().database;
    final beehiveType = await database.rawQuery(
        'SELECT * FROM $tableName WHERE beehives_type_id = ?', [beehiveTypeId]);
    return LivestockBeehiveType.fromSqfliteDatabase(beehiveType.first);
  }

  // Add more database methods as needed
}
