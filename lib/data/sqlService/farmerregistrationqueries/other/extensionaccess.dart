import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerExtensionAccessDB {
  final tableName = 'tblfrfarmerextensionaccess';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_extension_access_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "extension_source_id" INTEGER NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_extension_access_id")
      );
    """);
  }

  Future<int> create(FarmerExtensionAccess extensionAccess) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, extension_source_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      extensionAccess.farmerId,
      extensionAccess.farmerFarmId,
      extensionAccess.extensionSourceId,
      DateTime.now().toLocal().toIso8601String(),
      extensionAccess.createdBy,
    ]);
  }

  Future<int> update(FarmerExtensionAccess extensionAccess) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        extension_source_id = ? 
      WHERE farmer_extension_access_id = ?
    ''', [
      extensionAccess.extensionSourceId,
      extensionAccess.farmerExtensionAccessId,
    ]);
  }

  Future<int> insertExtensionAccess(
      List<FarmerExtensionAccess> extensionAccesses) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionAccess in extensionAccesses) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, extension_source_id, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?)
        ''', [
          extensionAccess.farmerId,
          extensionAccess.farmerFarmId,
          extensionAccess.extensionSourceId,
          DateTime.now().toLocal().toIso8601String(),
          extensionAccess.createdBy,
          0,
          extensionAccess.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertExtensionAccess(
      List<FarmerExtensionAccess> extensionAccesses) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionAccess in extensionAccesses) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ? WHERE farmer_farm_id = ? AND extension_source_id = ?
        ''', [
          extensionAccess.dateCreated?.toLocal().toIso8601String(),
          extensionAccess.farmerFarmId,
          extensionAccess.extensionSourceId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerExtensionAccess>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final extensionAccesses = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active =  1
    ''');

    return extensionAccesses
        .map((e) => FarmerExtensionAccess.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerExtensionAccess>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerExtensionAccess.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
    UPDATE $tableName SET active = 0 WHERE farmer_farm_id = ?
    ''', [id]);
  }
  // Add more database methods as needed
}
