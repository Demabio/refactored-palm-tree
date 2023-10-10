import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerFarmDB {
  final tableName = 'tblfrfarmerfarm';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmer_farm_id" INTEGER NOT NULL,
        "farmer_id" INTEGER NOT NULL,
        "ownership_id" INTEGER,
        "farm_name" VARCHAR(255),
        "farm_lr_cert" VARCHAR(255),
        "farm_size" DOUBLE,
        "crop_farm_size" DOUBLE,
        "livestock_farm_size" DOUBLE,
        "leased_farm_size" DOUBLE,
        "idle_farm_size" DOUBLE,
        "area_unit_id" INTEGER,
        "lease_years" INTEGER,
        "x" DOUBLE,
        "y" DOUBLE,
        "accuracy_level" INTEGER,
        "other_farm_elsewhere" INTEGER,
        "date_created" DATETIME,
        "created_by" INT,
        PRIMARY KEY("farmer_farm_id")
      );
    """);
  }

  Future<int> create(FarmerFarm farm) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id,  date_created, created_by
      ) VALUES (?, ?, ?)
    ''', [
      farm.farmerId,
      farm.dateCreated?.toLocal().toIso8601String(),
      farm.createdBy,
    ]);
  }

  Future<int> updatePageTwo(FarmerFarm farm) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
      x = ?, y = ?, ownership_id = ?, farm_lr_cert = ?, other_farm_elsewhere = ?
      WHERE farmer_farm_id = ?
    ''', [
      farm.x,
      farm.y,
      farm.ownershipId,
      farm.farmLrCert,
      farm.otherFarmElsewhere! ? 1 : 0,
      farm.farmerFarmId,
    ]);
  }

  Future<int> updatePageOne(FarmerFarm farm) async {
    final database = await DatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
      farm_name = ?, farm_size = ?, area_unit_id = ?, crop_farm_size = ?, livestock_farm_size = ?, leased_farm_size = ?, idle_farm_size = ? 
      WHERE farmer_farm_id = ?
    ''', [
      farm.farmName,
      farm.farmSize,
      farm.areaUnitId,
      farm.cropFarmSize,
      farm.livestockFarmSize,
      farm.leasedFarmSize,
      farm.idleFarmSize,
      farm.farmerFarmId,
    ]);
  }

  Future<List<FarmerFarm>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerFarms = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerFarms.map((e) => FarmerFarm.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerFarm?> fetchByFarmerFarmId(int farmerFarmId) async {
    final database = await DatabaseService().database;
    final farmerFarm = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [farmerFarmId]);

    return farmerFarm.isNotEmpty
        ? FarmerFarm.fromSqfliteDatabase(farmerFarm.first)
        : null;
  }

  // Add more database methods as needed
}
