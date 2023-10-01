class FarmerIrrigationType {
  final int irrigationCropId;
  final int farmerId;
  final int irrigationTypeId;
  final String othersName;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerIrrigationType({
    required this.irrigationCropId,
    required this.farmerId,
    required this.irrigationTypeId,
    required this.othersName,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigationType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIrrigationType(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        irrigationTypeId: map['irrigation_type_id']?.toInt() ?? 0,
        othersName: map['others_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
