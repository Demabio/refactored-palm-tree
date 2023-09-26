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

  factory FishProductionType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FishProductionType(
        productionTypeId: map['production_type_id']?.toInt() ?? 0,
        fishProductionType: map['fish_production_type'] ?? '',
        unitOfMeasureId: map['unit_of_measure_id']?.toInt() ?? 0,
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
