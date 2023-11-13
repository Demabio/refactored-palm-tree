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
import 'package:kiamis_app/data/models/farmerregistrationmodels/other/pesticide.dart';
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

  Future<String> test() async {
    List<String> jsonList = [];

    List<Farmer>? farmers = await farmerDB.fetchCompleted();

    if (farmers != null) {
      for (Farmer farmer in farmers) {
        List<FarmerFarm>? farms = await farmDB.fetchByFarmer(farmer.farmerId);
        String farmsjson = await farmsJson(farms);
        var farmerJson = farmer.toJson();
        var farmerjsonstring = jsonEncode(farmerJson);
        var payLoad = {
          'farmer': farmerjsonstring,
          'farms': farmsjson,
        };
        jsonList.add(jsonEncode(payLoad));
      }
    }
    return jsonList.join(",");
  }

  Future<String> cropsJson(List<FarmerCrop>? crops) async {
    List<String> jsonList = [];

    if (crops != null) {
      for (FarmerCrop crop in crops) {
        List<FarmerFertiliser>? fertilisers =
            await fertiliserDB.fetchByCropId(crop.farmerCropId);

        String fertiliserJson = fertilisersJson(fertilisers);

        List<FarmerFertiliserSource>? sources =
            await fertiliserSourcesDB.fetchByCropId(crop.farmerCropId);

        String fertsourcesJson = fertilisersourcesJson(sources);

        List<FarmerPesticide>? pesticides =
            await pesticidesDB.fetchByCropId(crop.farmerCropId);

        String pesticidejson = pesticidesJson(pesticides);

        var cropJson = crop.toJson();
        var payload = {
          'crop': cropJson,
          'fertilisers': fertiliserJson,
          'fertilisersources': fertsourcesJson,
          'pesticides': pesticidejson,
        };
        jsonList.add(jsonEncode(payload));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  Future<String> farmsJson(List<FarmerFarm>? farms) async {
    List<String> jsonList = [];

    if (farms != null) {
      for (FarmerFarm farm in farms) {
        List<FarmerCrop>? crops =
            await farmerCropsDB.fetchAllByFarm(farm.farmerId);

        String cropjson = await cropsJson(crops);

        List<FarmerLivestock>? lives =
            await livestockDB.fetchByFarm(farm.farmerFarmId);

        String livestockjson = await livestockJson(lives);

        var farmJson = farm.toJson();
        var payload = {
          'farm': farmJson,
          'crops': cropjson,
          'livestock': livestockjson,
        };
        jsonList.add(jsonEncode(payload));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  Future<String> livestockJson(List<FarmerLivestock>? lives) async {
    List<String> jsonList = [];

    if (lives != null) {
      for (FarmerLivestock live in lives) {
        List<FarmerLivestockAgeGroup>? ages =
            await livestockAgeGroupsDB.fetchByLive(live.farmerLivestockId);

        List<FarmerLivestockFeed> feeds =
            await livestockFeedsDB.fetchAllByLivestock(live.farmerLivestockId);

        String agesjson = agegroupssJson(ages);

        String feedsjson = feedsJson(feeds);

        var liveJson = live.toJson();
        var payload = {
          'livestock': liveJson,
          'agegroup': agesjson,
          'feeds': feedsjson,
        };
        jsonList.add(jsonEncode(payload));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String enterprisesJson(List<FarmerEnterprise>? enterprises) {
    List<String> jsonList = [];

    if (enterprises != null) {
      for (FarmerEnterprise enterprise in enterprises) {
        var enterpriseJson = enterprise.toJson();
        jsonList.add(jsonEncode(enterpriseJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String fertilisersJson(List<FarmerFertiliser>? ferts) {
    List<String> jsonList = [];

    if (ferts != null) {
      for (FarmerFertiliser fert in ferts) {
        var fertJson = fert.toJson();
        jsonList.add(jsonEncode(fertJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String fertilisersourcesJson(List<FarmerFertiliserSource>? sources) {
    List<String> jsonList = [];

    if (sources != null) {
      for (FarmerFertiliserSource source in sources) {
        var sourceJson = source.toJson();
        jsonList.add(jsonEncode(sourceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String pesticidesJson(List<FarmerPesticide>? pesticides) {
    List<String> jsonList = [];

    if (pesticides != null) {
      for (FarmerPesticide pesticide in pesticides) {
        var pesticideJson = pesticide.toJson();
        jsonList.add(jsonEncode(pesticideJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String agegroupssJson(List<FarmerLivestockAgeGroup>? ages) {
    List<String> jsonList = [];

    if (ages != null) {
      for (FarmerLivestockAgeGroup age in ages) {
        var ageJson = age.toJson();
        jsonList.add(jsonEncode(ageJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String feedsJson(List<FarmerLivestockFeed>? feeds) {
    List<String> jsonList = [];

    if (feeds != null) {
      for (FarmerLivestockFeed feed in feeds) {
        var feedJson = feed.toJson();
        jsonList.add(jsonEncode(feedJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String aquatypesJson(List<FarmerFishCategory>? categs) {
    List<String> jsonList = [];

    if (categs != null) {
      for (FarmerFishCategory category in categs) {
        var categoryJson = category.toJson();
        jsonList.add(jsonEncode(categoryJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String fishproductionsJson(List<FarmerFishProductionSystem>? prods) {
    List<String> jsonList = [];

    if (prods != null) {
      for (FarmerFishProductionSystem prod in prods) {
        var prodJson = prod.toJson();
        jsonList.add(jsonEncode(prodJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String fishJson(List<FarmerFish>? fishes) {
    List<String> jsonList = [];

    if (fishes != null) {
      for (FarmerFish fish in fishes) {
        var fishJson = fish.toJson();
        jsonList.add(jsonEncode(fishJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String inputsJson(List<FarmerFishInput>? inputs) {
    List<String> jsonList = [];

    if (inputs != null) {
      for (FarmerFishInput input in inputs) {
        var inputJson = input.toJson();
        jsonList.add(jsonEncode(inputJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String powersourcessJson(List<FarmerPowerSource>? sources) {
    List<String> jsonList = [];

    if (sources != null) {
      for (FarmerPowerSource source in sources) {
        var sourceJson = source.toJson();
        jsonList.add(jsonEncode(sourceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String assetsJson(List<FarmerAsset>? asset) {
    List<String> jsonList = [];

    if (asset != null) {
      for (FarmerAsset assetItem in asset) {
        var assetJson = assetItem.toJson();
        jsonList.add(jsonEncode(assetJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String structuresJson(List<FarmerStructure>? structures) {
    List<String> jsonList = [];

    if (structures != null) {
      for (FarmerStructure structure in structures) {
        var structureJson = structure.toJson();
        jsonList.add(jsonEncode(structureJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String landpracticesJson(List<FarmerLandPractice>? practices) {
    List<String> jsonList = [];

    if (practices != null) {
      for (FarmerLandPractice practice in practices) {
        var practiceJson = practice.toJson();
        jsonList.add(jsonEncode(practiceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String watersourcessJson(List<FarmerIrrigationWaterSource>? sources) {
    List<String> jsonList = [];

    if (sources != null) {
      for (FarmerIrrigationWaterSource source in sources) {
        var sourceJson = source.toJson();
        jsonList.add(jsonEncode(sourceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String irrigationtypesJson(List<FarmerIrrigationType>? types) {
    List<String> jsonList = [];

    if (types != null) {
      for (FarmerIrrigationType type in types) {
        var typeJson = type.toJson();
        jsonList.add(jsonEncode(typeJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String irrigationschemesJson(List<FarmerIrrigationCategory>? categs) {
    List<String> jsonList = [];

    if (categs != null) {
      for (FarmerIrrigationCategory category in categs) {
        var categoryJson = category.toJson();
        jsonList.add(jsonEncode(categoryJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String agenciesJson(List<FarmerIrrigationAgency>? agencies) {
    List<String> jsonList = [];

    if (agencies != null) {
      for (FarmerIrrigationAgency agency in agencies) {
        var agencyJson = agency.toJson();
        jsonList.add(jsonEncode(agencyJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String incomesourcesJson(List<FarmerIncomeSource>? sources) {
    List<String> jsonList = [];

    if (sources != null) {
      for (FarmerIncomeSource source in sources) {
        var sourceJson = source.toJson();
        jsonList.add(jsonEncode(sourceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String cooperativesJson(List<FarmerCooperativeGroup>? groups) {
    List<String> jsonList = [];

    if (groups != null) {
      for (FarmerCooperativeGroup group in groups) {
        var groupJson = group.toJson();
        jsonList.add(jsonEncode(groupJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String extensionservicesJson(List<FarmerExtensionAccess>? accesses) {
    List<String> jsonList = [];

    if (accesses != null) {
      for (FarmerExtensionAccess access in accesses) {
        var accessJson = access.toJson();
        jsonList.add(jsonEncode(accessJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String agriinfosJson(List<FarmerAgriInfoSource>? sources) {
    List<String> jsonList = [];

    if (sources != null) {
      for (FarmerAgriInfoSource source in sources) {
        var sourceJson = source.toJson();
        jsonList.add(jsonEncode(sourceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String creditservicessJson(List<FarmerCreditService>? services) {
    List<String> jsonList = [];

    if (services != null) {
      for (FarmerCreditService service in services) {
        var serviceJson = service.toJson();
        jsonList.add(jsonEncode(serviceJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }

  String extensionmodesJson(List<FarmerExtensionMode>? modes) {
    List<String> jsonList = [];

    if (modes != null) {
      for (FarmerExtensionMode mode in modes) {
        var modeJson = mode.toJson();
        jsonList.add(jsonEncode(modeJson));
      }
    }

    // Join the list of JSON strings into a single string with a separator (e.g., a comma)
    return jsonList.join(",");
  }
}
