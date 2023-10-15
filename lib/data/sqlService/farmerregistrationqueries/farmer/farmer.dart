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
        
        "alreadyRegistered" BOOLEAN, 
        PRIMARY KEY("farmerId")
      );
    """);
  }

  // Future<int> create(Farmer farmer) async {
  //   final database = await DatabaseService().database;
  //   return await database.rawInsert('''
  //     INSERT INTO $tableName (
  //       "idNo", "oldNrc", "nrcChanged", "farmerNo", "nfrRegistrationStatusId", "registrationStatusId", "farmerName",
  //       "farmerTheRespodent", "respondentName", "respondentRlshpId", "respondentMobile", "respNationalId", "nfrFarmerStatusId",
  //       "farmerStatusId", "farmerTypeId", "dateOfRegistration", "villageName", "constituencyId", "divisionId", "sublocationId",
  //       "wardId", "enumerationAreaNumber", "shoppingCenter", "gender", "email", "mobile", "dob", "postalAddress", "postalCode",
  //       "educationLevelId", "cultivatedSizeHa", "cropProd", "livestockProd", "fishFarming", "livelihoodSourceId", "labourSourceId",
  //       "agriSkillsId", "agriInfoSourceId", "gokFertiliser", "limeUsage", "certifiedSeedUse", "cropsInsurance", "livestockInsurance",
  //       "fishInsurance", "farmingIncomePercent", "assetsInsurance", "farmRecords", "irrigationUse", "irrigationArea",
  //       "cooperativeGroup", "extensionsericeAccess", "organizationId", "enumeratorName", "enumeratorId", "enumeratorMobile",
  //       "dateCreated", "createdBy", "dateCaptured", "approvedBy", "dateApproved", "editedBy", "dateEdited", "editApprovedBy",
  //       "dateEditApproved", "cooperativeSociety", "maritalStatusId", "avgAnnualHouseholdIncome", "monthlyHhExpenditure", "dataSourceId",
  //       "hhSize", "formalAgriTraining", "accountNo", "approvedList", "dateApprovedList", "dateOfConflict", "dateRequestedForDelete",
  //       "dateDeleted", "campChangeRequestStatus", "comments", "startOfRegistration", "endOfRegistration"
  //     )
  //     VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,
  //       ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  //   ''', [
  //     farmer.idNo,
  //     farmer.oldNrc,
  //     farmer.nrcChanged ? 1 : 0,
  //     farmer.farmerNo,
  //     farmer.nfrRegistrationStatusId,
  //     farmer.registrationStatusId,
  //     farmer.farmerName,
  //     farmer.farmerTheRespodent ? 1 : 0,
  //     farmer.respondentName,
  //     farmer.respondentRlshpId,
  //     farmer.respondentMobile,
  //     farmer.respNationalId,
  //     farmer.nfrFarmerStatusId,
  //     farmer.farmerStatusId,
  //     farmer.farmerTypeId,
  //     farmer.dateOfRegistration?.toLocal().toIso8601String(),
  //     farmer.villageName,
  //     farmer.constituencyId,
  //     farmer.divisionId,
  //     farmer.sublocationId,
  //     farmer.wardId,
  //     farmer.enumerationAreaNumber,
  //     farmer.shoppingCenter,
  //     farmer.gender,
  //     farmer.email,
  //     farmer.mobile,
  //     farmer.dob,
  //     farmer.postalAddress,
  //     farmer.postalCode,
  //     farmer.educationLevelId,
  //     farmer.cultivatedSizeHa,
  //     farmer.cropProd ? 1 : 0,
  //     farmer.livestockProd ? 1 : 0,
  //     farmer.fishFarming ? 1 : 0,
  //     farmer.livelihoodSourceId,
  //     farmer.labourSourceId,
  //     farmer.agriSkillsId,
  //     farmer.agriInfoSourceId,
  //     farmer.gokFertiliser ? 1 : 0,
  //     farmer.limeUsage ? 1 : 0,
  //     farmer.certifiedSeedUse,
  //     farmer.cropsInsurance ? 1 : 0,
  //     farmer.livestockInsurance ? 1 : 0,
  //     farmer.fishInsurance ? 1 : 0,
  //     farmer.farmingIncomePercent,
  //     farmer.assetsInsurance ? 1 : 0,
  //     farmer.farmRecords ? 1 : 0,
  //     farmer.irrigationUse ? 1 : 0,
  //     farmer.irrigationArea,
  //     farmer.cooperativeGroup ? 1 : 0,
  //     farmer.extensionsericeAccess,
  //     farmer.organizationId,
  //     farmer.enumeratorName,
  //     farmer.enumeratorId,
  //     farmer.enumeratorMobile,
  //     farmer.dateCreated.toLocal().toIso8601String(),
  //     farmer.createdBy,
  //     farmer.dateCaptured?.toLocal().toIso8601String(),
  //     farmer.approvedBy,
  //     farmer.dateApproved?.toLocal().toIso8601String(),
  //     farmer.editedBy,
  //     farmer.dateEdited?.toLocal().toIso8601String(),
  //     farmer.editApprovedBy,
  //     farmer.dateEditApproved?.toLocal().toIso8601String(),
  //     farmer.cooperativeSociety,
  //     farmer.maritalStatusId,
  //     farmer.avgAnnualHouseholdIncome,
  //     farmer.monthlyHhExpenditure,
  //     farmer.dataSourceId,
  //     farmer.hhSize,
  //     farmer.formalAgriTraining ? 1 : 0,
  //     farmer.accountNo,
  //     farmer.approvedList,
  //     farmer.dateApprovedList?.toLocal().toIso8601String(),
  //     farmer.dateOfConflict?.toLocal().toIso8601String(),
  //     farmer.dateRequestedForDelete?.toLocal().toIso8601String(),
  //     farmer.dateDeleted?.toLocal().toIso8601String(),
  //     farmer.campChangeRequestStatus,
  //     farmer.comments,
  //     farmer.startOfRegistration?.toLocal().toIso8601String(),
  //     farmer.endOfRegistration?.toLocal().toIso8601String(),
  //   ]);
  // }

  Future<int> insertNonNullable(Farmer farmer) async {
    final database = await DatabaseService().database;
    return await database.rawInsert('''
    INSERT INTO $tableName (
      "idNo", "farmerName", "dateCreated", "createdBy"
    ) 
    VALUES (?, ?, ?, ?)
  ''', [
      farmer.idNo,
      farmer.farmerName,
      farmer.dateCreated!.toLocal().toIso8601String(),
      farmer.createdBy,
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
    UPDATE $tableName SET dob = ?, gender = ?, idNo = ?, mobile = ?, email = ?, postalAddress = ? WHERE farmerId = ? 
  ''', [
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
    UPDATE $tableName SET farmerTheRespodent = ?, respondentRlshpId = ?, respondentName = ?, respNationalId = ?, respondentMobile = ? 
    WHERE farmerId = ? 
  ''', [
        farmer.farmerTheRespodent! ? 1 : 0,
        farmer.respondentRlshpId,
        farmer.respondentName,
        farmer.respNationalId,
        farmer.respondentMobile,
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
