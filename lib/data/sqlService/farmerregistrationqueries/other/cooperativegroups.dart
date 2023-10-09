import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerCooperativeGroupDB {
  final tableName = 'tblfrfarmercooperativegroup';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_cooperative_group_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "cooperative_group_id" INTEGER NOT NULL,
        "cooperative_group_name" VARCHAR(255),
        "other" TEXT,
        "created_by" INT,
        "date_created" DATETIME NOT NULL,
        PRIMARY KEY("farmer_cooperative_group_id")
      );
    """);
  }

  Future<int> create(FarmerCooperativeGroup cooperativeGroup) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, cooperative_group_id, cooperative_group_name, other, created_by, date_created
      ) VALUES (?, ?, ?, ?, ?, ?, ?)
    ''', [
      cooperativeGroup.farmerId,
      cooperativeGroup.farmerFarmId,
      cooperativeGroup.cooperateiveGroupId,
      cooperativeGroup.cooperateiveGroupName,
      cooperativeGroup.other,
      cooperativeGroup.createdBy,
      DateTime.now().toLocal().toIso8601String(),
    ]);
  }

  Future<int> update(FarmerCooperativeGroup cooperativeGroup) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        cooperative_group_id = ?, cooperative_group_name = ?, other = ?
      WHERE farmer_cooperative_group_id = ?
    ''', [
      cooperativeGroup.cooperateiveGroupId,
      cooperativeGroup.cooperateiveGroupName,
      cooperativeGroup.other,
      cooperativeGroup.farmerCooperativeGroupId,
    ]);
  }

  Future<int> insertCooperativeGroups(
      List<FarmerCooperativeGroup> cooperativeGroups) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var cooperativeGroup in cooperativeGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, cooperative_group_id, cooperative_group_name, other, created_by, date_created
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          cooperativeGroup.farmerId,
          cooperativeGroup.farmerFarmId,
          cooperativeGroup.cooperateiveGroupId,
          cooperativeGroup.cooperateiveGroupName,
          cooperativeGroup.other,
          cooperativeGroup.createdBy,
          DateTime.now().toLocal().toIso8601String(),
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerCooperativeGroup>> fetchAll() async {
    final database = await DatabaseService().database;
    final cooperativeGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return cooperativeGroups
        .map((e) => FarmerCooperativeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
