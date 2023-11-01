import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_cooperative_group_id")
      );
    """);
  }

  Future<int> create(FarmerCooperativeGroup cooperativeGroup) async {
    final database = await FarmerDatabaseService().database;
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
    final database = await FarmerDatabaseService().database;
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
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var cooperativeGroup in cooperativeGroups) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, cooperative_group_id, cooperative_group_name, other, created_by, date_created, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          cooperativeGroup.farmerId,
          cooperativeGroup.farmerFarmId,
          cooperativeGroup.cooperateiveGroupId,
          cooperativeGroup.cooperateiveGroupName,
          cooperativeGroup.other,
          cooperativeGroup.createdBy,
          DateTime.now().toLocal().toIso8601String(),
          0,
          cooperativeGroup.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertCooperativeGroups(
      List<FarmerCooperativeGroup> cooperativeGroups) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var cooperativeGroup in cooperativeGroups) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1,  cooperative_group_name = ?, other = ?, date_created = ? WHERE farmer_id = ? AND cooperative_group_id = ?
        ''', [
          cooperativeGroup.cooperateiveGroupName,
          cooperativeGroup.other,
          cooperativeGroup.dateCreated?.toLocal().toIso8601String(),
          cooperativeGroup.farmerFarmId,
          cooperativeGroup.cooperateiveGroupId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerCooperativeGroup>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final cooperativeGroups = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return cooperativeGroups
        .map((e) => FarmerCooperativeGroup.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerCooperativeGroup>?> fetchByFarmerId(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?  AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerCooperativeGroup.fromSqfliteDatabase(e))
            .toList()
        : null;
  }

  Future<List<FarmerCooperativeGroup>?> fetchByFarmerIdAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish
            .map((e) => FarmerCooperativeGroup.fromSqfliteDatabase(e))
            .toList()
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
