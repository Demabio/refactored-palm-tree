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
}
