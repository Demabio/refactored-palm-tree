class FishProductionLevel {
  final int productionLevelId;
  final String productionLevel;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FishProductionLevel({
    required this.productionLevelId,
    required this.productionLevel,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FishProductionLevel.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FishProductionLevel(
        productionLevelId: map['production_level_id']?.toInt() ?? 0,
        productionLevel: map['production_level'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<FishProductionLevel> parseFishProductionLevels(
      Map<String, dynamic> json) {
    final fishProductionLevelsList =
        json['data']['getallFishProductionLevels'] as List<dynamic>;

    return fishProductionLevelsList
        .map((productionLevelData) => FishProductionLevel(
              productionLevelId: productionLevelData['productionLevelId'] ?? 0,
              productionLevel: productionLevelData['productionLevel'] ?? '',
              description: productionLevelData['description'] ?? '',
              createdBy: productionLevelData['createdBy'] ?? 0,
              dateCreated:
                  DateTime.parse(productionLevelData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
