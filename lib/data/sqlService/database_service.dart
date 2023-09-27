import 'package:kiamis_app/core/app_export.dart';
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
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionlevels.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductionuom.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationwatersources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestock.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfarmingsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestocksubcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriskills.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/conservationagripractices.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/educationlevel.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/householdrelationships.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/livelihoodsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/maritalstatus.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/pesticidetype.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'logindb.dart';

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
  }
}
