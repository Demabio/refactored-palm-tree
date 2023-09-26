import 'package:sqflite/sqflite.dart';

import '../../../models/dbModels/livestock/livestockfarmingsystem.dart';
import '../../database_service.dart';

class LivestockFarmingSystemDB {
  final tableName = 'tblfrlivestockfarmingsystem';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "livestock_farmsystem_id" INTEGER NOT NULL,
        "livestock_farmsystem" VARCHAR(255) NOT NULL,
        "livestock_farmsystem_code" VARCHAR(255) NOT NULL,
        "date_created" DATETIME NOT NULL,
        "created_by" VARCHAR(255) NOT NULL,
        PRIMARY KEY("livestock_farmsystem_id")
      );
    """);
  }

  Future<int> create({
    required int id,
    required String livestockFarmingSystem,
    required String livestockFarmingSystemCode,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (livestock_farmsystem_id, livestock_farmsystem, livestock_farmsystem_code, date_created, created_by) 
      VALUES (?, ?, ?, ?, ?)
    ''', [
      id,
      livestockFarmingSystem,
      livestockFarmingSystemCode,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<int> insertLivestockFarmSystems(
      List<LivestockFarmingSystem> livestockFarmSystems) async {
    final database = await DatabaseService().database;
    final batch = database.batch();
    try {
      for (var system in livestockFarmSystems) {
        batch.rawInsert('''
        INSERT INTO $tableName (livestock_farmsystem_id, livestock_farmsystem, livestock_farmsystem_code, date_created, created_by) 
        VALUES (?, ?, ?, ?, ?)
      ''', [
          system.livestockFarmsystemId,
          system.livestockFarmsystem,
          system.livestockFarmsystemCode,
          system.dateCreated.toLocal().toIso8601String(),
          system.createdBy,
        ]);
      }

      await batch.commit(noResult: true);
      return 200;
    } catch (e) {
      return 500;
    }
  }

  Future<List<LivestockFarmingSystem>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmingSystems = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmingSystems
        .map((e) => LivestockFarmingSystem.fromSqfliteDatabase(e))
        .toList();
  }

  Future<LivestockFarmingSystem> fetchByLivestockFarmingSystemId(
      int livestockFarmingSystemId) async {
    final database = await DatabaseService().database;
    final farmingSystem = await database.rawQuery('''
      SELECT * FROM $tableName WHERE livestock_farmsystem_id = ?
    ''', [livestockFarmingSystemId]);

    return LivestockFarmingSystem.fromSqfliteDatabase(farmingSystem.first);
  }

  // Add more database methods as needed
}
