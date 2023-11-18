import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerExtensionModeDB {
  final tableName = 'tblfrfarmerextensionmode';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_extension_mode_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "farmer_farm_id" INTEGER NOT NULL,
        "extension_mode_id" INTEGER NOT NULL,
        "other" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        "active" INT,
        "enumerator_id" INT,
        PRIMARY KEY("farmer_extension_mode_id")
      );
    """);
  }

  Future<int> create(FarmerExtensionMode extensionMode) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, extension_mode_id, other, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?)
    ''', [
      extensionMode.farmerId,
      extensionMode.farmerFarmId,
      extensionMode.extensionModeId,
      extensionMode.other,
      DateTime.now().toLocal().toIso8601String(),
      extensionMode.createdBy,
    ]);
  }

  Future<int> update(FarmerExtensionMode extensionMode) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
        extension_mode_id = ?, other = ? 
      WHERE farmer_extension_mode_id = ?
    ''', [
      extensionMode.extensionModeId,
      extensionMode.other,
      extensionMode.extensionModeId,
    ]);
  }

  Future<int> insertExtensionModes(
      List<FarmerExtensionMode> extensionModes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionMode in extensionModes) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, extension_mode_id, other, date_created, created_by, active, enumerator_id
          ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ''', [
          extensionMode.farmerId,
          extensionMode.farmerFarmId,
          extensionMode.extensionModeId,
          extensionMode.other,
          DateTime.now().toLocal().toIso8601String(),
          extensionMode.createdBy,
          0,
          extensionMode.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<int> reinsertExtensionModes(
      List<FarmerExtensionMode> extensionModes) async {
    final database = await FarmerDatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionMode in extensionModes) {
        batch.rawUpdate('''
        UPDATE $tableName SET active = 1, date_created = ?, other = ?  WHERE farmer_farm_id = ? AND extension_mode_id = ?
        ''', [
          extensionMode.dateCreated?.toLocal().toIso8601String(),
          extensionMode.other,
          extensionMode.farmerFarmId,
          extensionMode.extensionModeId,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerExtensionMode>> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final extensionModes = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return extensionModes
        .map((e) => FarmerExtensionMode.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerExtensionMode>?> fetchByFarm(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ? AND active = 1
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerExtensionMode.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<List<FarmerExtensionMode>?> fetchByFarmAll(int id) async {
    final database = await FarmerDatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerExtensionMode.fromSqfliteDatabase(e)).toList()
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
