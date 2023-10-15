import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/sqlService/database_service.dart';
import 'package:sqflite/sqflite.dart';

class FarmerDB {
  final tableName = 'farmer';

  Future<void> createTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName (
        "farmerId" INTEGER NOT NULL,
        "idNo" VARCHAR(255) NOT NULL,
        "oldNrc" VARCHAR(255),
        "nrcChanged" BOOLEAN,
        "farmerNo" VARCHAR(255),
        "nfrRegistrationStatusId" INTEGER,
        "registrationStatusId" INTEGER,
        "farmerName" VARCHAR(255),
        "farmerTheRespodent" BOOLEAN,
        "respondentName" VARCHAR(255),
        "respondentRlshpId" INTEGER,
        "respondentMobile" VARCHAR(255),
        "respNationalId" VARCHAR(255),
        "nfrFarmerStatusId" INTEGER ,
        "farmerStatusId" INTEGER,
        "farmerTypeId" INTEGER ,
        "villageName" VARCHAR(255),
        "constituencyId" INTEGER,
        "divisionId" INTEGER,
        "sublocationId" INTEGER,
        "wardId" INTEGER,
        "gender" INTEGER ,
        "email" VARCHAR(255),
        "mobile" VARCHAR(255),
        "dob" INTEGER,
        "postalAddress" VARCHAR(255),
        "postalCode" VARCHAR(255),
        "educationLevelId" INTEGER,
        "cultivatedSizeHa" REAL,
        "livelihoodSourceId" INTEGER,
        "labourSourceId" INTEGER,
        "agriSkillsId" INTEGER,
        "agriInfoSourceId" INTEGER,
        "farmingIncomePercent" REAL,
        "cooperativeGroup" BOOLEAN,
        "extensionsericeAccess" INTEGER,
        "organizationId" INTEGER,
        "dateCreated" DATETIME ,
        "createdBy" INTEGER,
        "dateCaptured" DATETIME,
        "approvedBy" INTEGER,
        "dateApproved" DATETIME,
        "editedBy" INTEGER,
        "dateEdited" DATETIME,
        "editApprovedBy" INTEGER,
        "dateEditApproved" DATETIME,
        "cooperativeSociety" VARCHAR(255),
        "maritalStatusId" INTEGER,
        "avgAnnualHouseholdIncome" INTEGER,
        "monthlyHhExpenditure" INTEGER,
        "dataSourceId" INTEGER,
        "hhSize" INTEGER,
        "formalAgriTraining" BOOLEAN,
        "accountNo" VARCHAR(255),
        "approvedList" INTEGER ,
        "dateApprovedList" DATETIME,
        "dateOfConflict" DATETIME,
        "dateRequestedForDelete" DATETIME,
        "dateDeleted" DATETIME,
        "campChangeRequestStatus" INTEGER,
        "comments" VARCHAR(255),     
        "completed" BOOLEAN, 
        PRIMARY KEY("farmerId")
      );
    """);
  }

  Future<int> insertNonNullable(Farmer farmer) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
    INSERT INTO $tableName (
      "idNo", "farmerName", "dateCreated", "createdBy", completed
    ) 
    VALUES (?, ?, ?, ?, ?)
  ''', [
      farmer.idNo,
      farmer.farmerName,
      farmer.dateCreated!.toLocal().toIso8601String(),
      farmer.createdBy,
      0,
    ]);
  }

  Future<int> updatePageOne(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET  farmerName = ?, idNo = ?, dob = ?, gender = ?, idNo = ?, mobile = ?, email = ?, postalAddress = ?  
    WHERE farmerId = ? 
  ''', [
        farmer.villageName,
        farmer.shoppingCenter,
        farmer.farmerName,
        farmer.idNo,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updatePageTwo(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET  farmerName = ?, dob = ?, gender = ?, idNo = ?, mobile = ?, email = ?, postalAddress = ? WHERE farmerId = ? 
  ''', [
        farmer.farmerName,
        farmer.dob,
        farmer.gender,
        farmer.idNo,
        farmer.mobile,
        farmer.email,
        farmer.postalAddress,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updatePageThree(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET postalCode = ?, maritalStatusId = ?, agriSkillsId = ?, educationLevelId = ?, hhSize = ? WHERE farmerId = ? 
  ''', [
        farmer.postalCode,
        farmer.maritalStatusId,
        farmer.agriSkillsId,
        farmer.educationLevelId,
        farmer.hhSize,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updatePageFour(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET farmerTheRespodent = ?, respondentRlshpId = ?, respondentName = ?, respNationalId = ?, respondentMobile = ?, completed = ?
    WHERE farmerId = ? 
  ''', [
        farmer.farmerTheRespodent! ? 1 : 0,
        farmer.respondentRlshpId,
        farmer.respondentName,
        farmer.respNationalId,
        farmer.respondentMobile,
        1,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromFarmAsset(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET labourSourceId = ?  
    WHERE farmerId = ? 
  ''', [
        farmer.labourSourceId,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromLandWater(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET gokFertiliser = ?, limeUsage = ? 
    WHERE farmerId = ? 
  ''', [
        farmer.gokFertiliser! ? 1 : 0,
        farmer.limeUsage! ? 1 : 0,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromLandWaterTwo(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET irrigationUse = ?, irrigationArea = ?  
    WHERE farmerId = ? 
  ''', [
        farmer.irrigationUse! ? 1 : 0,
        farmer.irrigationArea,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromFinancial(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET cooperativeGroup = ?, farmingIncomePercent = ?  
    WHERE farmerId = ? 
  ''', [
        farmer.cooperativeGroup! ? 1 : 0,
        farmer.farmingIncomePercent,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateFromFinancialTwo(Farmer farmer) async {
    final database = await DatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET cropsInsurance = ?, livestockInsurance = ?, fishInsurance = ?, farmRecords = ?, assetsInsurance = ?, extensionsericeAccess = ? 
    WHERE farmerId = ? 
  ''', [
        farmer.cropsInsurance! ? 1 : 0,
        farmer.livestockInsurance! ? 1 : 0,
        farmer.fishInsurance! ? 1 : 0,
        farmer.assetsInsurance! ? 1 : 0,
        farmer.farmRecords! ? 1 : 0,
        farmer.extensionsericeAccess,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<List<Farmer>> fetchAll() async {
    final database = await DatabaseService().database;
    final farmerList = await database.rawQuery('SELECT * FROM $tableName');
    return farmerList.map((e) => Farmer.fromSqfliteDatabase(e)).toList();
  }

  Future<Farmer?> fetchByFarmerId(int farmerId) async {
    final database = await DatabaseService().database;
    final farmer = await database
        .rawQuery('SELECT * FROM $tableName WHERE farmerId = ?', [farmerId]);
    print(farmer);
    return farmer.isNotEmpty ? Farmer.fromSqfliteDatabase(farmer.first) : null;
  }

  Future<Farmer?> fetchByIDNo(String id) async {
    final database = await DatabaseService().database;
    final farmer = await database
        .rawQuery('SELECT * FROM $tableName WHERE idNo = ?', [id]);
    print(farmer);
    return farmer.isNotEmpty ? Farmer.fromSqfliteDatabase(farmer.first) : null;
  }

  // Add more database methods as needed
}
