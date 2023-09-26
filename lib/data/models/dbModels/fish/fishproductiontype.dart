class FishProductionType {
  final int productionTypeId;
  final String fishProductionType;
  final int unitOfMeasureId;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FishProductionType({
    required this.productionTypeId,
    required this.fishProductionType,
    required this.unitOfMeasureId,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
