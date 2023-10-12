import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropmotive.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropscategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassets.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassetsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassettypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmerstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmertypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmlandpractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmownership.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmpowersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmstructures.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fertiliser/fertilisertypecategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fish.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/agegroup.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriskills.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/conservationagripractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/householdrelationships.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/livelihoodsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/registrationstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
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
import 'package:kiamis_app/data/sqlService/farmerregistrationqueries/livestock/livestockfarmcategory.dart';
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

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialise();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'localdevice.db';
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
    //await LoginDB().createTable(database);
    await CropDB().createTable(database);
    await CropAreaUnitDB().createTable(database);
    await CropPlantingMotiveDB().createTable(database);
    await CropCategoriesDB().createTable(database);
    await CropSystemDB().createTable(database);
    await CropWaterSourceDB().createTable(database);
//
    await FarmAssetDB().createTable(database);
    await FarmAssetSourceDB().createTable(database);
    await FarmAssetTypeDB().createTable(database);
    await FarmerStatusDB().createTable(database);
    await FarmerTypeDB().createTable(database);
    await FarmlandPracticeDB().createTable(database);
    await FarmerFarmOwnershipDB().createTable(database);
    await FarmPowerSourceDB().createTable(database);
    await FarmStructureDB().createTable(database);
//
    await FertiliserSourceDB().createTable(database);
    await FertiliserTypeDB().createTable(database);
    await FertiliserTypeCategoriesDB().createTable(database);
    //
    await FishCategoryDB().createTable(database);
    await FishProductionTypeDB().createTable(database);
    await FishProductionLevelDB().createTable(database);
    await FishProductionUnitOfMeasureDB().createTable(database);
//
    await IrrigationAgencyDB().createTable(database);
    await IrrigationCategoryDB().createTable(database);
    await IrrigationTypeDB().createTable(database);
    await IrrigationWaterSourceDB().createTable(database);
//
    await LivestockDB().createTable(database);
    await LivestockCategoryDB().createTable(database);
    await LivestockFarmingSystemDB().createTable(database);
    await LivestockFeedTypeDB().createTable(database);
    await LivestockSubcategoryDB().createTable(database);
//
    await AgriManagementSkillsDB().createTable(database);
    await AgriInfoSourceDB().createTable(database);
    await AgriPracticeDB().createTable(database);
    await CreditSourceDB().createTable(database);
    await EducationLevelDB().createTable(database);
    await EnterprisesDB().createTable(database);
    await ExtensionSourceDB().createTable(database);
    await HouseholdRelationshipsDB().createTable(database);
    await IncomeSourceDB().createTable(database);
    await LabourSourceDB().createTable(database);
    await LivelihoodSourceDB().createTable(database);
    await MaritalStatusDB().createTable(database);
    await PesticideTypeDB().createTable(database);
    await RespondentRelationshipDB().createTable(database);

    //
    await FishTypeDB().createTable(database);
    await FarmersRegistrationStatusDB().createTable(database);
    await LivestockAgeGroupDB().createTable(database);
    await LivestockBeehiveTypeDB().createTable(database);
    await ExtensionModeDB().createTable(database);
    await CooperativeGroupDB().createTable(database);

    //Farmer Registration

    //
    await FarmerCropsDB().createTable(database);

    //
    await FarmerDB().createTable(database);
    await FarmerFarmDB().createTable(database);

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
