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
}
