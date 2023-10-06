class FarmerIrrigationWaterSource {
  final int irrigationCropId;
  final int farmerId;
  final int irrigationWaterSourceId;
  final String sourceName;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerIrrigationWaterSource({
    required this.irrigationCropId,
    required this.farmerId,
    required this.irrigationWaterSourceId,
    required this.sourceName,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigationWaterSource.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerIrrigationWaterSource(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        irrigationWaterSourceId:
            map['irrigation_water_source_id']?.toInt() ?? 0,
        sourceName: map['source_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
