class FarmerCrop {
  final int farmerCropId;
  final int farmerId;
  final int farmerFarmId;
  final int? cropId;
  final int? cropCode;
  final double? cropArea;
  final int? areaUnitId;
  final int? cropMotiveId;
  final int? waterSourceId;
  final bool? usageOfCertifiedSeeds;
  final int? cropSystemId;
  final int? fertilizerUse;
  final int? pesticideUse;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerCrop({
    required this.farmerCropId,
    required this.farmerId,
    required this.farmerFarmId,
    this.cropId,
    this.cropCode,
    this.cropArea,
    this.areaUnitId,
    this.cropMotiveId,
    this.waterSourceId,
    this.usageOfCertifiedSeeds,
    this.cropSystemId,
    this.fertilizerUse,
    this.pesticideUse,
    this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerCropId': farmerCropId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'cropId': cropId,
      'cropCode': cropCode,
      'cropArea': cropArea,
      'areaUnitId': areaUnitId,
      'cropMotiveId': cropMotiveId,
      'waterSourceId': waterSourceId,
      'usageOfCertifiedSeeds': usageOfCertifiedSeeds,
      'cropSystemId': cropSystemId,
      'fertilizerUse': fertilizerUse,
      'pesticideUse': pesticideUse,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerCrop.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerCrop(
        farmerCropId: map['farmer_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        cropId: map['crop_id']?.toInt() ?? 0,
        cropCode: int.parse(map['crop_code'] ?? "0"),
        cropArea: map['crop_area']?.toDouble(),
        areaUnitId: map['area_unit_id']?.toInt(),
        cropMotiveId: map['crop_motive_id']?.toInt(),
        waterSourceId: map['water_source_id']?.toInt(),
        usageOfCertifiedSeeds: map['usage_of_certified_seeds'] == 1,
        cropSystemId: map['crop_system_id']?.toInt() ?? 0,
        fertilizerUse: map['fertilizer_use']?.toInt() ?? 0,
        pesticideUse: map['pesticide_use']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
