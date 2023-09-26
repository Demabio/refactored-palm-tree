class FarmPowerSource {
  final int powerSourceId;
  final String powerSource;
  final String? description;

  FarmPowerSource({
    required this.powerSourceId,
    required this.powerSource,
    this.description,
  });

  factory FarmPowerSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmPowerSource(
        powerSourceId: map['power_source_id']?.toInt() ?? 0,
        powerSource: map['power_source'] ?? '',
        description: map['description'],
      );
}
