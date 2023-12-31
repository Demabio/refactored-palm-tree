class FarmerIrrigationCrop {
  final int irrigationCropId;
  final int farmerId;
  final int? cropId;
  final int? areaOfCrop;
  final int? areaUnitId;
  final int? noOfCropPerYear;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerIrrigationCrop({
    required this.irrigationCropId,
    required this.farmerId,
    required this.cropId,
    this.areaOfCrop,
    this.areaUnitId,
    this.noOfCropPerYear,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });

  Map<String, dynamic> toJson() {
    return {
      'irrigationCropId': irrigationCropId,
      'farmerId': farmerId,
      'cropId': cropId,
      'areaOfCrop': areaOfCrop,
      'areaUnitId': areaUnitId,
      'noOfCropPerYear': noOfCropPerYear,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerIrrigationCrop.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIrrigationCrop(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        cropId: map['crop_id']?.toInt() ?? 0,
        areaOfCrop: map['area_of_crop']?.toInt() ?? 0,
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        noOfCropPerYear: map['no_of_crop_per_year']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
