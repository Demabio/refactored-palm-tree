class CropWaterSource {
  final int waterSourceId;
  final String waterSource;
  final DateTime dateCreated;
  final int? createdBy;

  CropWaterSource({
    required this.waterSourceId,
    required this.waterSource,
    required this.dateCreated,
    this.createdBy,
  });

  factory CropWaterSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropWaterSource(
        waterSourceId: map['water_source_id']?.toInt() ?? 0,
        waterSource: map['water_source'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
