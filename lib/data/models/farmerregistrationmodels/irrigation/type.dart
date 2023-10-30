class FarmerIrrigationType {
  final int irrigationCropId;
  final int farmerId;
  int farmerFarmId;

  final int irrigationTypeId;
  final String? othersName;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerIrrigationType({
    required this.irrigationCropId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.irrigationTypeId,
    this.othersName,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'irrigationCropId': irrigationCropId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'irrigationTypeId': irrigationTypeId,
      'othersName': othersName,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerIrrigationType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIrrigationType(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        irrigationTypeId: map['irrigation_type_id']?.toInt() ?? 0,
        othersName: map['others_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
