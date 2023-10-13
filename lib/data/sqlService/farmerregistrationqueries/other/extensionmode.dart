import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_extension_mode_id")
      );
    """);
  }

  Future<int> create(FarmerExtensionMode extensionMode) async {
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
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
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionMode in extensionModes) {
        batch.rawInsert('''
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

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerExtensionMode>> fetchAll() async {
    final database = await DatabaseService().database;
    final extensionModes = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return extensionModes
        .map((e) => FarmerExtensionMode.fromSqfliteDatabase(e))
        .toList();
  }

  Future<List<FarmerExtensionMode>?> fetchByFarmerId(int id) async {
    final database = await DatabaseService().database;
    final fish = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);

    return fish.isNotEmpty
        ? fish.map((e) => FarmerExtensionMode.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<int> delete(int id) async {
    final database = await DatabaseService().database;
    return await database.rawDelete('''
      DELETE FROM $tableName WHERE farmer_id = ?
    ''', [
      id,
    ]);
  }
  // Add more database methods as needed
}
