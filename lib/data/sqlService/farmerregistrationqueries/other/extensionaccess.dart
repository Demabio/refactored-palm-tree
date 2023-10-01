import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
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
        PRIMARY KEY("farmer_extension_access_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int farmerFarmId,
    required int extensionSourceId,
    String? createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, farmer_farm_id, extension_source_id, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?)
    ''', [
      farmerId,
      farmerFarmId,
      extensionSourceId,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertExtensionAccess(
      List<FarmerExtensionAccess> extensionAccesses) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var extensionAccess in extensionAccesses) {
        batch.rawInsert('''
          INSERT INTO $tableName (
            farmer_id, farmer_farm_id, extension_source_id, date_created, created_by
          ) VALUES (?, ?, ?, ?, ?)
        ''', [
          extensionAccess.farmerId,
          extensionAccess.farmerFarmId,
          extensionAccess.extensionSourceId,
          extensionAccess.dateCreated.toLocal().toIso8601String(),
          extensionAccess.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<FarmerExtensionAccess>> fetchAll() async {
    final database = await DatabaseService().database;
    final extensionAccesses = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return extensionAccesses
        .map((e) => FarmerExtensionAccess.fromSqfliteDatabase(e))
        .toList();
  }

  // Add more database methods as needed
}
