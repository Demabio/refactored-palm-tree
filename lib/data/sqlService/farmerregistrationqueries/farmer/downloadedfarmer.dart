import 'package:kiamis_app/data/sqlService/downloaded_farmer_database_service.dart';
import 'package:tuple/tuple.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:sqflite/sqflite.dart';

class DFarmerDB {
  final tableName = 'Farmers';

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
    final database = await FarmerWardDatabaseService().database;
    return await database.rawInsert('''
    INSERT INTO $tableName (
     "registrationStatusId","idNo", "farmerName", "dateCreated", "createdBy", completed
    ) 
    VALUES (?, ?, ?, ?, ?, ?)
  ''', [
      1,
      farmer.idNo,
      farmer.farmerName,
      farmer.dateCreated!.toLocal().toIso8601String(),
      farmer.createdBy,
      0,
    ]);
  }

  Future<int> updatePageOne(Farmer farmer) async {
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
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
    final database = await FarmerWardDatabaseService().database;
    try {
      return await database.rawUpdate('''
    UPDATE $tableName SET cropsInsurance = ?, livestockInsurance = ?, fishInsurance = ?, farmRecords = ?, assetsInsurance = ?, extensionsericeAccess = ?, completed = ?
    WHERE farmerId = ? 
  ''', [
        farmer.cropsInsurance! ? 1 : 0,
        farmer.livestockInsurance! ? 1 : 0,
        farmer.fishInsurance! ? 1 : 0,
        farmer.assetsInsurance! ? 1 : 0,
        farmer.farmRecords! ? 1 : 0,
        farmer.extensionsericeAccess,
        1,
        farmer.farmerId,
      ]);
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<int> updateToPosted(Farmer farmer) async {
    final database = await FarmerWardDatabaseService().database;
    try {
      return await database.rawUpdate(
        '''
    UPDATE $tableName SET registrationStatusId = 2
    WHERE completed = 1
  ''',
      );
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  Future<List<Farmer>> fetchAll() async {
    final database = await FarmerWardDatabaseService().database;
    final farmerList = await database.rawQuery('SELECT * FROM $tableName');
    return farmerList.map((e) => Farmer.fromSqfliteDatabase(e)).toList();
  }

  Future<List<Farmer>?> fetchCompleted() async {
    final database = await FarmerWardDatabaseService().database;
    final farmerList =
        await database.rawQuery('SELECT * FROM $tableName WHERE completed = 0');
    return farmerList.isNotEmpty
        ? farmerList.map((e) => Farmer.fromSqfliteDatabase(e)).toList()
        : null;
  }

  Future<Farmer?> fetchByFarmerId(int farmerId) async {
    final database = await FarmerWardDatabaseService().database;
    final farmer = await database
        .rawQuery('SELECT * FROM $tableName WHERE farmerId = ?', [farmerId]);
    print(farmer);
    return farmer.isNotEmpty ? Farmer.fromSqfliteDatabase(farmer.first) : null;
  }

  Future<Farmer?> fetchByIDNo(String id) async {
    final database = await FarmerWardDatabaseService().database;
    final farmer = await database
        .rawQuery('SELECT * FROM $tableName WHERE idNo = ?', [id]);
    print(farmer);
    return farmer.isNotEmpty ? Farmer.fromSqfliteDatabase(farmer.first) : null;
  }

  Future<int?> getFarmersCount() async {
    final database = await FarmerWardDatabaseService().database;

    final result = await database.rawQuery('SELECT COUNT(*) FROM farmer');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<int?> getSaved() async {
    final database = await FarmerWardDatabaseService().database;

    final result = await database
        .rawQuery('SELECT COUNT(*) FROM farmer WHERE completed = 0');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<int?> getApproved() async {
    final database = await FarmerWardDatabaseService().database;

    final result = await database.rawQuery(
        'SELECT COUNT(*) FROM farmer WHERE registrationStatusId IN (3,5,8)');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<int?> getUnapproved() async {
    final database = await FarmerWardDatabaseService().database;

    final result = await database.rawQuery(
        'SELECT COUNT(*) FROM farmer WHERE registrationStatusId IN (4,6,9)');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<Tuple2<int?, int?>?> regAccuracy() async {
    int? approved = await getApproved();
    int? rejected = await getUnapproved();

    return Tuple2<int?, int?>(approved, rejected);
  }

  Future<Tuple2<int?, int?>?> regPie() async {
    int? ver = await getApproved();
    int? unver = await getUnverified();

    return Tuple2<int?, int?>(ver, unver);
  }

  Future<int?> getUnverified() async {
    final database = await FarmerWardDatabaseService().database;

    final result = await database.rawQuery(
        'SELECT COUNT(*) FROM farmer WHERE registrationStatusId IN (1,2)');
    final count = Sqflite.firstIntValue(result);
    return count;
  }

  Future<Map<String, Object?>> getApprovedAndRejectedFarmersCountByMonth(
      int year, int month) async {
    final database = await FarmerWardDatabaseService().database;

    final startDate = DateTime(year, month);
    final endDate = DateTime(year, month + 1);

    final approvedResult = await database.rawQuery(
        'SELECT COUNT(*) FROM farmer WHERE dateCreated >= ? AND dateCreated < ? AND registrationStatusId IN (3,5,8) ',
        [
          startDate.toUtc().toIso8601String(),
          endDate.toUtc().toIso8601String()
        ]);
    final rejectedResult = await database.rawQuery(
        'SELECT COUNT(*) FROM farmer WHERE dateCreated >= ? AND dateCreated < ? AND registrationStatusId IN (4,6,9)',
        [
          startDate.toUtc().toIso8601String(),
          endDate.toUtc().toIso8601String()
        ]);

    final approvedCount = Sqflite.firstIntValue(approvedResult);
    final rejectedCount = Sqflite.firstIntValue(rejectedResult);

    //final monthName = DateFormat('MMMM').format(startDate);

    final result = {
      'month': month,
      'approved': approvedCount,
      'rejected': rejectedCount,
    };

    return result;
  }

  Future<List<Map<String, Object?>>?>
      getApprovedAndRejectedCountsForLast6Months() async {
    final now = DateTime.now();
    final results = <Map<String, Object?>>[];

    for (int i = 0; i < 6; i++) {
      var month = now.month - i;
      final year = now.year - (month <= 0 ? 1 : 0);
      month = (month <= 0 ? month + 12 : month);

      final counts =
          await getApprovedAndRejectedFarmersCountByMonth(year, month);
      results.add(counts);
    }

    return results;
  }

  Future<List<Tuple2<int, int>>?> getFarmersCountLast7Days() async {
    final database = await FarmerWardDatabaseService().database;

    // Calculate the start date (7 days ago)
    final now = DateTime.now();
    final startDate =
        now.subtract(Duration(days: 6)); // 6 days ago, as today is also counted

    final results = await database.rawQuery('''
    SELECT strftime('%w', dateCreated) as day, COUNT(*) as count
    FROM farmer
    WHERE dateCreated >= ?
    GROUP BY day
  ''', [startDate.toIso8601String()]);

    final counts = results.map((row) {
      final day = int.parse(row['day'].toString());
      final count = int.parse(row['count'].toString());
      return Tuple2<int, int>(day, count);
    }).toList();

    return counts;
  }

  // Add more database methods as needed
}
