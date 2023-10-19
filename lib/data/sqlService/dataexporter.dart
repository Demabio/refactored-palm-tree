import 'dart:convert';

import 'package:kiamis_app/data/models/farmerregistrationmodels/crops/crop.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farm.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/farmers/farmer.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertiliser.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fertiliser/fertilisersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fish.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishcategory.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/fishinput.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/fish/productionsystem.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/agency.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/category.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/type.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/irrigation/watersource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/agegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/feed.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/livestock/livestock.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/agriinfosource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/asset.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/cooperativegroup.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/creditservice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/enterprise.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionaccess.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/extensionmode.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/farmstructure.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/incomesource.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/landpractice.dart';
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/powersource.dart';
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

class DataExporter {
  factory DataExporter() {
    return _exporterClient;
  }

  DataExporter._internal();

  static final DataExporter _exporterClient = DataExporter._internal();

  FarmerDB farmerDB = FarmerDB();
  FarmerFarmDB farmDB = FarmerFarmDB();
  FarmerCropsDB farmerCropsDB = FarmerCropsDB();

  FarmerFertiliserSourcesDB fertiliserSourcesDB = FarmerFertiliserSourcesDB();
  FarmerFertiliserDB fertiliserDB = FarmerFertiliserDB();
  FarmerFishDB fishDB = FarmerFishDB();
  FarmerFishProductionLevelsDB fishProductionLevelsDB =
      FarmerFishProductionLevelsDB();
  FarmerFishProductionSystemDB fishProductionSystemDB =
      FarmerFishProductionSystemDB();
  FarmerFishCategoryDB fishCategoryDB = FarmerFishCategoryDB();
  FarmerFishInputDB fishInputDB = FarmerFishInputDB();
  FarmerIrrigationAgencyDB irrigationAgencyDB = FarmerIrrigationAgencyDB();
  FarmerIrrigationCategoryDB irrigationCategoryDB =
      FarmerIrrigationCategoryDB();
  FarmerIrrigationDB irrigationDB = FarmerIrrigationDB();
  FarmerIrrigationCropDB irrigationCropDB = FarmerIrrigationCropDB();
  FarmerIrrigationTypeDB irrigationTypeDB = FarmerIrrigationTypeDB();
  FarmerIrrigationWaterSourceDB irrigationWaterSourceDB =
      FarmerIrrigationWaterSourceDB();
  FarmerLivestockAgeGroupsDB livestockAgeGroupsDB =
      FarmerLivestockAgeGroupsDB();
  FarmerLivestockBeehiveTypeDB beehiveTypeDB = FarmerLivestockBeehiveTypeDB();
  FarmerLivestockDB livestockDB = FarmerLivestockDB();
  LivestockFarmSystemCategoryDB farmSystemCategoryDB =
      LivestockFarmSystemCategoryDB();
  FarmerLivestockFarmSystemDB farmSystemDB = FarmerLivestockFarmSystemDB();
  FarmerLivestockFeedsDB livestockFeedsDB = FarmerLivestockFeedsDB();
  FarmerLivestockServicesDB livestockServicesDB = FarmerLivestockServicesDB();
  FarmerAgriInfoSourceDB agriInfoSourceDB = FarmerAgriInfoSourceDB();
  FarmerAssetsDB assetsDB = FarmerAssetsDB();
  FarmerAssetSourceDB assetSourceDB = FarmerAssetSourceDB();
  FarmerCampChangeDB campChangeDB = FarmerCampChangeDB();
  FarmerCooperativeGroupDB cooperativeGroupDB = FarmerCooperativeGroupDB();
  FarmerCreditServiceDB creditServiceDB = FarmerCreditServiceDB();
  FarmerEnterprisesDB enterprisesDB = FarmerEnterprisesDB();
  FarmerExtensionModeDB extensionModeDB = FarmerExtensionModeDB();
  FarmerExtensionAccessDB extensionAccessDB = FarmerExtensionAccessDB();
  FarmerIncomeSourceDB incomeSourceDB = FarmerIncomeSourceDB();
  FarmerLandPracticesDB landPracticesDB = FarmerLandPracticesDB();
  FarmerPesticidesDB pesticidesDB = FarmerPesticidesDB();
  FarmerPowerSourceDB powerSourceDB = FarmerPowerSourceDB();
  FarmerProgramDB programDB = FarmerProgramDB();
  FarmerPremiumDB premiumDB = FarmerPremiumDB();
  FarmerSoilTestDB soilTestDB = FarmerSoilTestDB();
  FarmerStructureDB structureDB = FarmerStructureDB();

  Future<void> test() async {
    List<Farmer>? farmers = await farmerDB.fetchCompleted();

    if (farmers != null) {
      for (Farmer farmer in farmers) {
        List<FarmerFarm>? farms = await farmDB.fetchByFarmer(farmer.farmerId);
        List<FarmerCrop>? crops =
            await farmerCropsDB.fetchAllByFarmer(farmer.farmerId);
        var farmerJson = farmer.toJson();
        var farmerjsonstring = jsonEncode(farmerJson);
        var payLoad = {
          'farmer': farmerjsonstring,
        };

        String payloadstr = jsonEncode(payLoad);
      }
    }
  }

  String livestockJson(List<FarmerLivestock>? lives) {
    return "";
  }

  String cropsJson(List<FarmerCrop>? crops) {
    List<String> jsonList = [];

    if (crops != null) {
      for (FarmerCrop crop in crops) {
        var cropJson = crop.toJson();
        jsonList.add(jsonEncode(cropJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String farmsJson(List<FarmerFarm>? farms) {
    List<String> jsonList = [];

    if (farms != null) {
      for (FarmerFarm farm in farms) {
        var farmJson = farm.toJson();
        jsonList.add(jsonEncode(farmJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String enterprisesJson(List<FarmerEnterprise>? enterprises) {
    return "";
  }

  String fertilisersJson(List<FarmerFertiliser>? ferts) {
    return "";
  }

  String fertilisersourcessJson(List<FarmerFertiliserSource>? sources) {
    return "";
  }

  String agegroupssJson(List<FarmerLivestockAgeGroup>? ages) {
    return "";
  }

  String feedsJson(List<FarmerLivestockFeed>? feeds) {
    return "";
  }

  String aquatypesJson(List<FarmerFishCategory>? categs) {
    return "";
  }

  String fishproductionsJson(List<FarmerFishProductionSystem>? prods) {
    return "";
  }

  String fishJson(List<FarmerFish>? fishes) {
    return "";
  }

  String inputsJson(List<FarmerFishInput>? inputs) {
    return "";
  }

  String powersourcessJson(List<FarmerPowerSource>? sources) {
    return "";
  }

  String assetsJson(List<FarmerAsset>? asset) {
    return "";
  }

  String structuresJson(List<FarmerStructure>? structures) {
    return "";
  }

  String landpracticesJson(List<FarmerLandPractice>? practices) {
    return "";
  }

  String watersourcessJson(List<FarmerIrrigationWaterSource>? sources) {
    return "";
  }

  String irrigationtypesJson(List<FarmerIrrigationType>? types) {
    return "";
  }

  String irrigationschemesJson(List<FarmerIrrigationCategory>? categs) {
    return "";
  }

  String agenciesJson(List<FarmerIrrigationAgency>? agencies) {
    return "";
  }

  String incomesourcesJson(List<FarmerIncomeSource>? sources) {
    return "";
  }

  String cooperativesJson(List<FarmerCooperativeGroup>? groups) {
    return "";
  }

  String extensionservicesJson(List<FarmerExtensionAccess>? accesses) {
    return "";
  }

  String agriinfosJson(List<FarmerAgriInfoSource>? sources) {
    return "";
  }

  String creditservicessJson(List<FarmerCreditService>? services) {
    return "";
  }

  String extensionmodesJson(List<FarmerExtensionMode>? modes) {
    return "";
  }
}
