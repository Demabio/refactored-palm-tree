class FarmerFarm {
  int farmerFarmId;
  int farmerId;
  int? ownershipId;
  String? farmName;
  String? farmLrCert;
  double? farmSize;
  double? cropFarmSize;
  double? livestockFarmSize;
  double? leasedFarmSize;
  double? idleFarmSize;
  int? areaUnitId;
  int? leaseYears;
  double? x;
  double? y;
  double? accuracyLevel;
  bool? otherFarmElsewhere;
  DateTime? dateCreated;
  int? createdBy;
  final DateTime? dateOfRegistration;
  final String? villageName;

  final String? enumerationAreaNumber;
  final String? shoppingCenter;
  final bool? cropProd;
  final bool? livestockProd;
  final bool? fishFarming;
  final int? livelihoodSourceId;
  final int? labourSourceId;
  final int? agriInfoSourceId;
  final bool? gokFertiliser;
  final bool? limeUsage;
  final int? certifiedSeedUse;
  final bool? cropsInsurance;
  final bool? livestockInsurance;
  final bool? fishInsurance;
  final bool? assetsInsurance;
  final bool? farmRecords;
  final bool? irrigationUse;
  final double? irrigationArea;
  final int? extensionsericeAccess;
  final String? enumeratorName;
  final String? enumeratorId;
  final String? enumeratorMobile;
  final DateTime? startOfRegistration;
  final DateTime? endOfRegistration;
  final DateTime? dateDeleted;
  final bool? completed;

  FarmerFarm({
    required this.farmerFarmId,
    required this.farmerId,
    this.ownershipId,
    this.farmName,
    this.farmLrCert,
    this.farmSize,
    this.cropFarmSize,
    this.livestockFarmSize,
    this.leasedFarmSize,
    this.idleFarmSize,
    this.areaUnitId,
    this.leaseYears,
    this.x,
    this.y,
    this.accuracyLevel,
    this.otherFarmElsewhere,
    this.dateCreated,
    this.createdBy,
    this.villageName,
    this.enumerationAreaNumber,
    this.shoppingCenter,
    this.cropProd,
    this.livestockProd,
    this.fishFarming,
    this.livelihoodSourceId,
    this.labourSourceId,
    this.agriInfoSourceId,
    this.gokFertiliser,
    this.limeUsage,
    this.certifiedSeedUse,
    this.cropsInsurance,
    this.livestockInsurance,
    this.fishInsurance,
    this.assetsInsurance,
    this.farmRecords,
    this.irrigationUse,
    this.irrigationArea,
    this.extensionsericeAccess,
    this.enumeratorName,
    this.enumeratorId,
    this.enumeratorMobile,
    this.startOfRegistration,
    this.endOfRegistration,
    this.dateDeleted,
    this.dateOfRegistration,
    this.completed,
  });

  factory FarmerFarm.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFarm(
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        ownershipId: map['ownership_id']?.toInt() ?? 0,
        farmName: map['farm_name'] ?? '',
        farmLrCert: map['farm_lr_cert'],
        farmSize: map['farm_size']?.toDouble() ?? 0.0,
        cropFarmSize: map['crop_farm_size']?.toDouble(),
        livestockFarmSize: map['livestock_farm_size']?.toDouble(),
        leasedFarmSize: map['leased_farm_size']?.toDouble(),
        idleFarmSize: map['idle_farm_size']?.toDouble(),
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        leaseYears: map['lease_years']?.toInt(),
        x: map['x']?.toDouble(),
        y: map['y']?.toDouble(),
        accuracyLevel: map['accuracy_level']?.toDouble(),
        otherFarmElsewhere: map['other_farm_elsewhere'] == 1,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'],
        villageName: map['villageName'],
        enumerationAreaNumber: map['enumerationAreaNumber'],
        shoppingCenter: map['shoppingCenter'],
        cropProd: map['cropProd'] == 1,
        livestockProd: map['livestockProd'] == 1,
        fishFarming: map['fishFarming'] == 1,
        livelihoodSourceId: map['livelihoodSourceId']?.toInt(),
        labourSourceId: map['labourSourceId']?.toInt(),
        agriInfoSourceId: map['agriInfoSourceId']?.toInt(),
        gokFertiliser: map['gokFertiliser'] == 1,
        limeUsage: map['limeUsage'] == 1,
        certifiedSeedUse: map['certifiedSeedUse'],
        cropsInsurance: map['cropsInsurance'] == 1,
        livestockInsurance: map['livestockInsurance'] == 1,
        fishInsurance: map['fishInsurance'] == 1,
        assetsInsurance: map['assetsInsurance'] == 1,
        farmRecords: map['farmRecords'] == 1,
        irrigationUse: map['irrigationUse'] == 1,
        irrigationArea: map['irrigationArea']?.toDouble(),
        extensionsericeAccess: map['extensionsericeAccess']?.toInt(),
        enumeratorName: map['enumeratorName'],
        enumeratorId: map['enumeratorId'],
        enumeratorMobile: map['enumeratorMobile'],
        completed: map['completed'] == 1,
      );
  Map<String, dynamic> toJson() {
    return {
      'farmerFarmId': farmerFarmId,
      'farmerId': farmerId,
      'ownershipId': ownershipId,
      'farmName': farmName,
      'farmLrCert': farmLrCert,
      'farmSize': farmSize,
      'cropFarmSize': cropFarmSize,
      'livestockFarmSize': livestockFarmSize,
      'leasedFarmSize': leasedFarmSize,
      'idleFarmSize': idleFarmSize,
      'areaUnitId': areaUnitId,
      'leaseYears': leaseYears,
      'x': x,
      'y': y,
      'accuracyLevel': accuracyLevel,
      'otherFarmElsewhere': otherFarmElsewhere,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
      'dateOfRegistration': dateOfRegistration?.toIso8601String(),
      'villageName': villageName,
      'enumerationAreaNumber': enumerationAreaNumber,
      'shoppingCenter': shoppingCenter,
      'cropProd': cropProd,
      'livestockProd': livestockProd,
      'fishFarming': fishFarming,
      'livelihoodSourceId': livelihoodSourceId,
      'labourSourceId': labourSourceId,
      'agriInfoSourceId': agriInfoSourceId,
      'gokFertiliser': gokFertiliser,
      'limeUsage': limeUsage,
      'certifiedSeedUse': certifiedSeedUse,
      'cropsInsurance': cropsInsurance,
      'livestockInsurance': livestockInsurance,
      'fishInsurance': fishInsurance,
      'assetsInsurance': assetsInsurance,
      'farmRecords': farmRecords,
      'irrigationUse': irrigationUse,
      'irrigationArea': irrigationArea,
      'extensionsericeAccess': extensionsericeAccess,
      'enumeratorName': enumeratorName,
      'enumeratorId': enumeratorId,
      'enumeratorMobile': enumeratorMobile,
      'startOfRegistration': startOfRegistration?.toIso8601String(),
      'endOfRegistration': endOfRegistration?.toIso8601String(),
      'dateDeleted': dateDeleted?.toIso8601String(),
    };
  }
}
