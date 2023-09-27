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

  static List<FarmPowerSource> parseFarmPowerSources(
      Map<String, dynamic> json) {
    final farmPowerSourcesList =
        json['data']['getallFarmPowerSources'] as List<dynamic>;

    return farmPowerSourcesList
        .map((powerSourceData) => FarmPowerSource(
              powerSourceId: powerSourceData['powerSourceId'] ?? 0,
              powerSource: powerSourceData['powerSource'] ?? '',
              description: powerSourceData['description'] ?? '',
            ))
        .toList();
  }
}
