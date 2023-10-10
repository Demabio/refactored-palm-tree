class Graphql {
  static const String getallCrops = r'''
  query{
    getallCrops{
        commonCrop
        crop
        cropCatId
        cropCode
        cropId
        createdBy
        dateCreated
    }
  }
''';
  static const String getallCropCategories = r'''
  query{
    getallCropCategories{
        cropCategory
        cropCategoryCode
        cropCatId
        dateCreated
        createdBy
    }
}
''';
  static const String getallCropPlantingMotive = r'''
  query{
    getallCropPlantingMotive{
        createdBy
        cropMotive
        cropMotiveId
        dateCreated
    }
}
''';
  static const String getallCropSystems = r'''
  query{
    getallCropSystems{
        croppingSystem
        cropSystemId
        description
    }
}
''';
  static const String getallCropAreaUnits = r'''
  query{
    getallCropAreaUnits{
      createdBy
      areaUnit
      areaUnitId
      dateCreated
    }
  }
''';
  static const String getAllLivestocks = r'''
  query {
    getAllLivestocks {
      livestock
      livestockCode
      livestockId
      livestockSubCatId
      commonLivestock
      dateCreated
      createdBy
    }
  }
''';

  static const String getAllLivestockCategories = r'''
  query {
    getAllLivestockCategories {
      livestockCatId
      livestockCategory
      livestockCategoryCode
      dateCreated
      createdBy
    }
  }
''';

  static const String getAllLivestockSubcategories = r'''
  query {
    getAllLivestockSubcategories {
      livestockSubCatId
      livestockCatId
      livestockSubcategory
      livestockSubcategoryCode
      dateCreated
      createdBy
    }
  }
''';

  static const String getAllLivestockFarmingSystems = r'''
  query {
    getAllLivestockFarmingSystems {
      livestockFarmsystemId
      livestockFarmsystem
      livestockFarmsystemCode
      dateCreated
      createdBy
    }
  }
''';

  static const String getAllLivestockFeedTypes = r'''
  query {
    getAllLivestockFeedTypes {
      feedTypeId
      feedType
      dateCreated
      createdBy
    }
  }
''';

  static const String getallCropWaterSources = r'''
  query{
    getallCropWaterSources{
      waterSource
      waterSourceId
      createdBy
      dateCreated
    }
  }
''';
  static const String getallIrrigationWaterSources = r'''
  query {
    getallIrrigationWaterSources {
      irrigationWaterSourceId
      irrigationWaterSource
      dateCreated
      createdBy
    }
  }
''';
  static const String getallFishCategories = r'''
  query {
    getallFishCategories {
      fishCategoryId
      fishCategory
      fishCategoryCode
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFishProductionTypes = r'''
  query {
    getallFishProductionTypes {
      productionTypeId
      fishProductionType
      unitOfMeasureId
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFishProductionLevels = r'''
  query {
    getallFishProductionLevels {
      productionLevelId
      productionLevel
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFishProductionUOM = r'''
  query {
    getallFishProductionUOM {
      unitOfMeasureId
      unitOfMeasure
    }
  }
''';
  static const String getallFarmerFarmOwnerships = r'''
  query {
    getallFarmerFarmOwnerships {
      ownershipId
      createdBy
      ownershipDesc
      dateCreated
    }
  }
''';

  static const String getallFarmlandPractices = r'''
  query {
    getallFarmlandPractices {
      landPracticeId
      landPracticeName
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFarmAssetSources = r'''
  query {
    getallFarmAssetSources {
      assetSourceId
      assetSource
      description
    }
  }
''';

  static const String getallFarmAssetTypes = r'''
  query {
    getallFarmAssetTypes {
      assetTypeId
      asssetTypeCode
      assetName
      description
    }
  }
''';

  static const String getallFarmAssets = r'''
  query {
    getallFarmAssets {
      farmAssetId
      assetTypeId
      asset
      assetCode
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFarmPowerSources = r'''
  query {
    getallFarmPowerSources {
      powerSourceId
      powerSource
      description
    }
  }
''';

  static const String getallFarmStructures = r'''
  query {
    getallFarmStructures {
      farmStructureId
      structureName
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFarmerStatus = r'''
  query {
    getallFarmerStatus {
      farmerStatusId
      farmerStatus
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFarmerType = r'''
  query {
    getallFarmerType {
      farmerTypeId
      farmerType
      description
      dateCreated
      createdBy
    }
  }
''';
  static const String getallFertiliserTypeCategories = r'''
  query {
    getallFertiliserTypeCategories {
      fertiliserCategoryId
      fertiliserCategory
      description
    }
  }
''';

  static const String getallFertiliserTypes = r'''
  query {
    getallFertiliserTypes {
      fertiliserTypeId
      fertiliserCategoryId
      fertiliserType
      description
    }
  }
''';

  static const String getallFertiliserSources = r'''
  query {
    getallFertiliserSources {
      fertSourceId
      source
      description
      dateCreated
      createdBy
    }
  }
''';
  static const String getallEducationLevels = r'''
  query {
    getallEducationLevels {
      educationLevel
      createdBy
      educationLevelId
      dateCreated
      description
    }
  }
''';

  static const String getallPesticideTypes = r'''
  query {
    getallPesticideTypes {
      pesticideType
      pesticideTypeId
      description
    }
  }
''';

  static const String getallEnterprises = r'''
  query {
    getallEnterprises {
      enterpriseId
      enterpriseDesc
      dateCreated
      createdBy
    }
  }
''';

  static const String getallCreditSources = r'''
  query {
    getallCreditSources {
      creditSourceId
      creditSource
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallExtensionSources = r'''
  query {
    getallExtensionSources {
      extensionSourceId
      sourceType
      description
    }
  }
''';

  static const String getallRespondentRelationships = r'''
  query {
    getallRespondentRelationships {
      respondendRlshpId
      rlshpToFarmer
      description
      dateCreated
      createdBy
    }
  }
''';
  static const String getallMaritalStatus = r'''
  query {
    getallMaritalStatus {
      maritalStatusId
      maritalStatus
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallLivelihoodSource = r'''
  query {
    getallLivelihoodSource {
      livelihoodSourceId
      livelihoodSource
      desc
      dateCreated
      createdBy
    }
  }
''';

  static const String getallLabourSource = r'''
  query {
    getallLabourSource {
      labourSourceId
      labourSource
      desc
      dateCreated
      createdBy
    }
  }
''';

  static const String getallAgriInfoSource = r'''
  query {
    getallAgriInfoSource {
      agriInfoSourceId
      agriInfoSource
      desc
      dateCreated
      createdBy
    }
  }
''';

  static const String getallAgriManagementSkills = r'''
  query {
    getallAgriManagementSkills {
      agriSkillsId
      agriSkills
      dateCreated
      createdBy
    }
  }
''';

  static const String getallAgriPractice = r'''
  query {
    getallAgriPractice {
      agriPracticeId
      agriPractice
      dateCreated
      createdBy
    }
  }
''';

  static const String getallIncomeSource = r'''
  query {
    getallIncomeSource {
      incomeSourceId
      incomeSource
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallHouseholdRelationship = r'''
  query {
    getallHouseholdRelationship {
      hhRlshpId
      rlshpToHead
      description
      dateCreated
      createdBy
    }
  }
''';
  static const String getallIrrigationAgencies = r'''
  query {
    getallIrrigationAgencies {
      irrigationAgencyId
      agencyName
      dateCreated
      createdBy
    }
  }
''';

  static const String getallIrrigationTypes = r'''
  query {
    getallIrrigationTypes {
      irrigationTypeId
      irrigationType
      dateCreated
      createdBy
    }
  }
''';

  static const String getallIrrigationCategories = r'''
  query {
    getallIrrigationCategories {
      irrigationCategoryId
      irrigationCategory
      dateCreated
      createdBy
    }
  }
''';
  static const String getallFish = r'''
  query {
    getallFish {
      fishTypeId
      fishCategoryId
      fishType
      fishCode
      commonFish
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallFarmerRegistrationStatuses = r'''
  query {
    getallFarmerRegistrationStatuses {
      registrationStatusId
      registrationStatus
      description
    }
  }
''';
  static const String getallAgeGroups = r'''
  query {
    getallAgeGroups {
      ageGroup
      ageGroupId
      createdBy
      dateCreated
    }
  }
''';

  static const String getallCooperativeGroups = r'''
  query {
    getallCooperativeGroups {
      cooperateiveGroupId
      group
      description
    }
  }
''';

  static const String getallBeeHiveTypes = r'''
  query {
    getallBeeHiveTypes {
      beehivesTypeId
      beeHiveType
    }
  }
''';

  static const String getallExtensionModes = r'''
  query {
    getallExtensionModes {
      extensionModeId
      sourceMode
      description
    }
  }
''';
  static const String getallFishInput = r'''
  query {
    getallFishInput {
      fishInputId
      fishInput
      description
      dateCreated
      createdBy
    }
  }
''';

  static const String getallIrrigationMembership = r'''
  query {
    getallIrrigationMembership {
      membershipTypeId
      irrigationMembershipType
      dateCreated
    }
  }
''';
}
