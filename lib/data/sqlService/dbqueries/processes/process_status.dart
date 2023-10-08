import 'package:kiamis_app/data/models/dbModels/processes/process_status.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class ProcessStatusDB {
  final tableName = 'process_status';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmerId" INTEGER NOT NULL,
        "farmeridentification" INTEGER,
        "primaryfarmholding" INTEGER,
        "cropAgriculture" INTEGER,
        "livestock" INTEGER,
        "aquaculture" INTEGER,
        "farmAssets" INTEGER,
        "landWater" INTEGER,
        "financialServices" INTEGER,
        PRIMARY KEY("farmerId")
      );
    """);
  }

  Future<int> create(ProcessStatus processStatus) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (farmerId, farmeridentification, primaryfarmholding, cropAgriculture, livestock, aquaculture, farmAssets, landWater, financialServices) 
      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      processStatus.farmerId,
      processStatus.farmeridentification,
      processStatus.primaryfarmholding,
      processStatus.cropAgriculture,
      processStatus.livestock,
      processStatus.aquaculture,
      processStatus.farmAssets,
      processStatus.landWater,
      processStatus.financialServices,
    ]);
  }

  Future<int> update(ProcessStatus processStatus) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      UPDATE $tableName SET farmeridentification = ?, primaryfarmholding = ?, cropAgriculture = ?, livestock = ?, aquaculture = ?, farmAssets = ?, landWater = ?, financialServices = ?
      WHERE farmerId = ?
    ''', [
      processStatus.farmeridentification,
      processStatus.primaryfarmholding,
      processStatus.cropAgriculture,
      processStatus.livestock,
      processStatus.aquaculture,
      processStatus.farmAssets,
      processStatus.landWater,
      processStatus.financialServices,
      processStatus.farmerId,
    ]);
  }

  Future<List<ProcessStatus>> fetchAll() async {
    final database = await DatabaseService().database;
    final processStatusList =
        await database.rawQuery('SELECT * FROM $tableName');
    return processStatusList
        .map((e) => ProcessStatus.fromSqfliteDatabase(e))
        .toList();
  }

  Future<ProcessStatus> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final processStatus = await database
        .rawQuery('SELECT * FROM $tableName WHERE farmerId = ?', [farmerId]);
    return ProcessStatus.fromSqfliteDatabase(processStatus.first);
  }

  // Add more database methods as needed
}
