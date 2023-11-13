import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/aqua_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/assets_tech_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/crop_agri.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/farmer_identification_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/financial_services.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/land_water_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_input.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/livestock_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/primary_farm_holding_progress.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/processes/process_status.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/crop/crops.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/downloadedfarmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farm.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/farmer/farmer.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fertiliser/fertiliser_source.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/fishinput.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionlevel.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/fish/productionsystem.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/agency.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/category.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/irrigation.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/irrigationcrop.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/type.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/irrigation/watersource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmcategory.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockfarmsystem.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockfeed.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockservices.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/agriinfosource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/assets.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/assetsource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/campchange.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/creditservice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/enterprise.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionaccess.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/extensionmode.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/landpractice.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/pesticide.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/powersource.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/premium.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/program.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/soiltest.dart';
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/other/structure.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FarmerDatabaseService {
  Database? _database;
  final claims = JWT.decode(PrefUtils().getToken());

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialise();
    return _database!;
  }

  Future<String> get fullPath async {
    String userId = claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
    String name = 'enumerator-$userId.db';
    final path = await getDatabasesPath();
    PrefUtils().setDBPath(path);
    return join(path, name);
  }

  Future<Database> _initialise() async {
    final path = await fullPath;
    var database = await openDatabase(path,
        version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version) async {
    //Farmer Registration

    //
    await FarmerCropsDB().createTable(database);

    //
    await FarmerDB().createTable(database);
    await FarmerFarmDB().createTable(database);
    await DFarmerDB().createTable(database);

    //
    await FarmerFertiliserSourcesDB().createTable(database);
    await FarmerFertiliserDB().createTable(database);

    //
    await FarmerFishDB().createTable(database);
    await FarmerFishProductionLevelsDB().createTable(database);
    await FarmerFishProductionSystemDB().createTable(database);
    await FarmerFishCategoryDB().createTable(database);
    await FarmerFishInputDB().createTable(database);

    //
    await FarmerIrrigationAgencyDB().createTable(database);
    await FarmerIrrigationCategoryDB().createTable(database);
    await FarmerIrrigationDB().createTable(database);
    await FarmerIrrigationCropDB().createTable(database);
    await FarmerIrrigationTypeDB().createTable(database);
    await FarmerIrrigationWaterSourceDB().createTable(database);

    //
    await FarmerLivestockAgeGroupsDB().createTable(database);
    await FarmerLivestockBeehiveTypeDB().createTable(database);
    await FarmerLivestockDB().createTable(database);
    await LivestockFarmSystemCategoryDB().createTable(database);
    await FarmerLivestockFarmSystemDB().createTable(database);
    await FarmerLivestockFeedsDB().createTable(database);
    await FarmerLivestockServicesDB().createTable(database);

    //
    await FarmerAgriInfoSourceDB().createTable(database);
    await FarmerAssetsDB().createTable(database);
    await FarmerAssetSourceDB().createTable(database);
    await FarmerCampChangeDB().createTable(database);
    await FarmerCooperativeGroupDB().createTable(database);
    await FarmerCreditServiceDB().createTable(database);
    await FarmerEnterprisesDB().createTable(database);
    await FarmerExtensionModeDB().createTable(database);
    await FarmerExtensionAccessDB().createTable(database);
    await FarmerIncomeSourceDB().createTable(database);
    await FarmerLandPracticesDB().createTable(database);
    await FarmerPesticidesDB().createTable(database);
    await FarmerPowerSourceDB().createTable(database);
    await FarmerProgramDB().createTable(database);
    await FarmerPremiumDB().createTable(database);
    await FarmerSoilTestDB().createTable(database);
    await FarmerStructureDB().createTable(database);

    //Progress tracking

    //
    await FIProgressDB().createTable(database);
    await ProcessStatusDB().createTable(database);
    await AQProgressDB().createTable(database);
    await PFProgressDB().createTable(database);
    await FSProgressDB().createTable(database);
    await LSProgressDB().createTable(database);
    await LWProgressDB().createTable(database);
    await CAProgressDB().createTable(database);
    await ATProgressDB().createTable(database);
    await LSIProgressDB().createTable(database);
  }
}
