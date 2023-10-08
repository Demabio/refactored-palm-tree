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
        "ownership_id" INTEGER NOT NULL,
        "farm_name" VARCHAR(255) NOT NULL,
        "farm_lr_cert" VARCHAR(255),
        "farm_size" DOUBLE,
        "crop_farm_size" DOUBLE,
        "leased_farm_size" DOUBLE,
        "idle_farm_size" DOUBLE,
        "area_unit_id" INTEGER NOT NULL,
        "lease_years" INTEGER,
        "x" DOUBLE,
        "y" DOUBLE,
        "accuracy_level" INTEGER,
        "other_farm_elsewhere" TEXT,
        "date_created" DATETIME NOT NULL,
        "created_by" INT,
        PRIMARY KEY("farmer_farm_id")
      );
    """);
  }

  Future<int> create({
    required int farmerId,
    required int ownershipId,
    required String farmName,
    String? farmLrCert,
    double? farmSize,
    double? cropFarmSize,
    double? leasedFarmSize,
    double? idleFarmSize,
    required int areaUnitId,
    int? leaseYears,
    double? x,
    double? y,
    int? accuracyLevel,
    String? otherFarmElsewhere,
    required String createdBy,
  }) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id, ownership_id, farm_name, farm_lr_cert, farm_size, crop_farm_size, leased_farm_size, idle_farm_size,
        area_unit_id, lease_years, x, y, accuracy_level, other_farm_elsewhere, date_created, created_by
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farmerId,
      ownershipId,
      farmName,
      farmLrCert,
      farmSize,
      cropFarmSize,
      leasedFarmSize,
      idleFarmSize,
      areaUnitId,
      leaseYears,
      x,
      y,
      accuracyLevel,
      otherFarmElsewhere,
      DateTime.now().toLocal().toIso8601String(),
      createdBy,
    ]);
  }

  Future<List<FarmerFarm>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerFarms = await database.rawQuery(''' 
      SELECT * FROM $tableName 
    ''');

    return farmerFarms.map((e) => FarmerFarm.fromSqfliteDatabase(e)).toList();
  }

  Future<FarmerFarm> fetchByFarmerFarmId(int farmerFarmId) async {
    final database = await DatabaseService().database;
    final farmerFarm = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_farm_id = ?
    ''', [farmerFarmId]);

    return FarmerFarm.fromSqfliteDatabase(farmerFarm.first);
  }

  // Add more database methods as needed
}
