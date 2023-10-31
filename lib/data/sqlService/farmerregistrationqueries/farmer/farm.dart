import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/sqlService/farmer_database_service.dart';
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
        "dateOfRegistration" DATETIME,
        "villageName" VARCHAR(255),
        "constituencyId" INTEGER,
        "divisionId" INTEGER,
        "sublocationId" INTEGER,
        "wardId" INTEGER,      
        "enumerationAreaNumber" VARCHAR(255),
        "shoppingCenter" VARCHAR(255),        
        "cropProd" BOOLEAN,
        "livestockProd" BOOLEAN,
        "fishFarming" BOOLEAN,
        "labourSourceId" INTEGER,
        "gokFertiliser" BOOLEAN,
        "limeUsage" BOOLEAN,
        "certifiedSeedUse" INTEGER,
        "cropsInsurance" BOOLEAN,
        "livestockInsurance" BOOLEAN,
        "fishInsurance" BOOLEAN,
        "assetsInsurance" BOOLEAN,
        "farmRecords" BOOLEAN,
        "irrigationUse" BOOLEAN,
        "irrigationArea" REAL,
        "extensionsericeAccess" INTEGER,
        "enumeratorName" VARCHAR(255),
        "enumeratorId" INT,
        "enumeratorMobile" VARCHAR(255),
        "startOfRegistration" DATETIME,
        "endOfRegistration" DATETIME,
        "dateDeleted" DATETIME,        
        "completed" BOOLEAN,
        "posted" INTEGER DEFAULT 0,
        "active" INT,
        PRIMARY KEY("farmer_farm_id")
      );
    """);
  }

  Future<int> create(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawInsert('''
      INSERT INTO $tableName (
        farmer_id,  date_created, created_by, completed, startOfRegistration, wardid, sublocationId, divisionId, constituencyId, active
      ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    ''', [
      farm.farmerId,
      farm.dateCreated?.toLocal().toIso8601String(),
      farm.createdBy,
      0,
      DateTime.now().toLocal().toIso8601String(),
      farm.wardId,
      farm.sublocationId,
      farm.divisionId,
      farm.constituencyId,
      1,
    ]);
  }

  Future<int> updatePageTwo(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
      cropProd = ?, livestockProd = ?, fishFarming = ?,  x = ?, y = ?, accuracy_level = ?, ownership_id = ?, farm_lr_cert = ?, other_farm_elsewhere = ?
      WHERE farmer_farm_id = ?
    ''', [
      farm.cropProd,
      farm.livestockProd,
      farm.fishFarming,
      farm.x,
      farm.y,
      farm.accuracyLevel?.toInt(),
      farm.ownershipId,
      farm.farmLrCert,
      farm.otherFarmElsewhere! ? 1 : 0,
      farm.farmerFarmId,
    ]);
  }

  Future<int> updatePageOne(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    return await database.rawUpdate('''
      UPDATE  $tableName SET
      villageName = ?, shoppingCenter = ?, enumerationAreaNumber = ?, enumeratorId = ?, enumeratorName = ?, enumeratorMobile = ?, farm_name = ?, farm_size = ?, area_unit_id = ?, crop_farm_size = ?, livestock_farm_size = ?, leased_farm_size = ?, idle_farm_size = ? 
      WHERE farmer_farm_id = ?
    ''', [
      farm.villageName,
      farm.shoppingCenter,
      farm.enumerationAreaNumber,
      farm.enumeratorId,
      farm.enumeratorName,
      farm.enumeratorMobile,
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

  Future<int> updateFromFarmAsset(FarmerFarm farmer) async {
    final database = await FarmerDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET labourSourceId = ?  
    WHERE farmer_farm_id = ? 
  ''', [
        farmer.labourSourceId,
        farmer.farmerFarmId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromLandWater(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET gokFertiliser = ?, limeUsage = ? 
    WHERE farmer_farm_id = ? 
  ''', [
        farm.gokFertiliser! ? 1 : 0,
        farm.limeUsage! ? 1 : 0,
        farm.farmerFarmId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromLandWaterTwo(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET irrigationUse = ?, irrigationArea = ?  
    WHERE farmer_farm_id = ? 
  ''', [
        farm.irrigationUse! ? 1 : 0,
        farm.irrigationArea,
        farm.farmerFarmId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromFinancialTwo(FarmerFarm farm) async {
    final database = await FarmerDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET cropsInsurance = ?, livestockInsurance = ?, fishInsurance = ?, farmRecords = ?, assetsInsurance = ?, extensionsericeAccess = ? 
    WHERE farmer_farm_id = ? 
  ''', [
        farm.cropsInsurance! ? 1 : 0,
        farm.livestockInsurance! ? 1 : 0,
        farm.fishInsurance! ? 1 : 0,
        farm.farmRecords! ? 1 : 0,
        farm.assetsInsurance! ? 1 : 0,
        farm.extensionsericeAccess,
        farm.farmerFarmId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> completed(int id) async {
    final database = await FarmerDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET completed  = ?, endOfRegistration = ?
    WHERE farmer_farm_id = ? 
  ''', [
        1,
        DateTime.now().toLocal().toIso8601String(),
        id,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<bool> checkPosted() async {
    final database = await FarmerDatabaseService().database;
    try {
      // Check if the "posted" column exists in the table
      final columns = await database.rawQuery('PRAGMA table_info($tableName)');
      final columnExists = columns.any((column) => column['name'] == 'posted');

      if (!columnExists) {
        // The "posted" column doesn't exist, so add it to the table
        await database.execute(
            'ALTER TABLE $tableName ADD COLUMN posted INTEGER DEFAULT 0');
      }
      return columnExists;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateToPosted() async {
    final database = await FarmerDatabaseService().database;
    try {
      // 1 - completed 2 - posted to KIAMIS
      return await database.rawUpdate(
        '''
    UPDATE $tableName SET posted = 1
    WHERE completed = 1 AND posted = 0
  ''',
      );
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<List<FarmerFarm>?> fetchAll() async {
    final database = await FarmerDatabaseService().database;
    final farmerFarms = await database.rawQuery(''' 
      SELECT * FROM $tableName WHERE active = 1
    ''');

    return farmerFarms.isNotEmpty
        ? farmerFarms.map((e) => FarmerFarm.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<List<FarmerFarm>?> fetchByFarmer(int id) async {
    final database = await FarmerDatabaseService().database;
    final farmerFarms = await database.rawQuery(''' 
      SELECT * FROM $tableName  WHERE farmer_id = ? AND active = 1 ORDER BY farmer_farm_id 
    ''', [id]);

    return farmerFarms.isNotEmpty
        ? farmerFarms.map((e) => FarmerFarm.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<FarmerFarm?> fetchByFarmerFarmId(int farmerFarmId) async {
    final database = await FarmerDatabaseService().database;
    final farmerFarm = await database.rawQuery('''
      SELECT * FROM $tableName WHERE farmer_farm_id = ?  AND active = 1
    ''', [farmerFarmId]);

    return farmerFarm.isNotEmpty
        ? FarmerFarm.fromSqfliteDatabase(farmerFarm.first)
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
