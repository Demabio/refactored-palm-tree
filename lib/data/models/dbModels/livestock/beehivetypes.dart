class LivestockBeehiveType {
  final int beehiveTypeId;
  final String beehiveType;

  LivestockBeehiveType({
    required this.beehiveTypeId,
    required this.beehiveType,
  });

  factory LivestockBeehiveType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivestockBeehiveType(
        beehiveTypeId: map['beehives_type_id']?.toInt() ?? 0,
        beehiveType: map['bee_hive_type'] ?? '',
      );

  static List<LivestockBeehiveType> parseBeeHiveTypes(
      Map<String, dynamic> json) {
    final beehiveTypesList =
        json['data']['getallBeeHiveTypes'] as List<dynamic>;

    return beehiveTypesList
        .map((beehiveTypeData) => LivestockBeehiveType(
              beehiveTypeId: beehiveTypeData['beehivesTypeId'] ?? 0,
              beehiveType: beehiveTypeData['beeHiveType'] ?? '',
            ))
        .toList();
  }
}
