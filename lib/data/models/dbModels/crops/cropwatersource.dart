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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<CropWaterSource> parseCropWaterSources(
      Map<String, dynamic> json) {
    final waterSourcesList =
        json['data']['getallCropWaterSources'] as List<dynamic>;

    return waterSourcesList
        .map((waterSourceData) => CropWaterSource(
              waterSourceId: waterSourceData['waterSourceId'] ?? 0,
              waterSource: waterSourceData['waterSource'] ?? '',
              createdBy: waterSourceData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(waterSourceData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
