class IrrigationWaterSource {
  final int irrigationWaterSourceId;
  final String irrigationWaterSource;
  final DateTime dateCreated;
  final int? createdBy;

  IrrigationWaterSource({
    required this.irrigationWaterSourceId,
    required this.irrigationWaterSource,
    required this.dateCreated,
    this.createdBy,
  });

  factory IrrigationWaterSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      IrrigationWaterSource(
        irrigationWaterSourceId:
            map['irrigation_water_source_id']?.toInt() ?? 0,
        irrigationWaterSource: map['irrigation_water_source'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
  static List<IrrigationWaterSource> parseIrrigationWaterSources(
      Map<String, dynamic> json) {
    final irrigationWaterSourcesList =
        json['data']['getallIrrigationWaterSources'] as List<dynamic>;

    return irrigationWaterSourcesList
        .map((waterSourceData) => IrrigationWaterSource(
              irrigationWaterSourceId:
                  waterSourceData['irrigationWaterSourceId'] ?? 0,
              irrigationWaterSource:
                  waterSourceData['irrigationWaterSource'] ?? '',
              createdBy: waterSourceData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(waterSourceData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
