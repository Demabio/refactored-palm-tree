class FarmerCrop {
  final int farmerCropId;
  final int farmerId;
  final int farmerFarmId;
  final int cropId;
  final int cropCode;
  final double? cropArea;
  final int? areaUnitId;
  final int? cropMotiveId;
  final int? waterSourceId;
  final bool? usageOfCertifiedSeeds;
  final int cropSystemId;
  final int fertilizerUse;
  final int pesticideUse;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerCrop({
    required this.farmerCropId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.cropId,
    required this.cropCode,
    this.cropArea,
    this.areaUnitId,
    this.cropMotiveId,
    this.waterSourceId,
    this.usageOfCertifiedSeeds,
    required this.cropSystemId,
    required this.fertilizerUse,
    required this.pesticideUse,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerCrop.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerCrop(
        farmerCropId: map['farmer_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        cropId: map['crop_id']?.toInt() ?? 0,
        cropCode: map['crop_code']?.toInt() ?? 0,
        cropArea: map['crop_area']?.toDouble(),
        areaUnitId: map['area_unit_id']?.toInt(),
        cropMotiveId: map['crop_motive_id']?.toInt(),
        waterSourceId: map['water_source_id']?.toInt(),
        usageOfCertifiedSeeds: map['usage_of_certified_seeds'],
        cropSystemId: map['crop_system_id']?.toInt() ?? 0,
        fertilizerUse: map['fertilizer_use']?.toInt() ?? 0,
        pesticideUse: map['pesticide_use']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
