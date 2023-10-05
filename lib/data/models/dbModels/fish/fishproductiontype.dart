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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );

  static List<FishProductionType> parseFishProductionTypes(
      Map<String, dynamic> json) {
    final fishProductionTypesList =
        json['data']['getallFishProductionTypes'] as List<dynamic>;

    return fishProductionTypesList
        .map((productionTypeData) => FishProductionType(
              productionTypeId: productionTypeData['productionTypeId'] ?? 0,
              fishProductionType:
                  productionTypeData['fishProductionType'] ?? '',
              unitOfMeasureId: productionTypeData['unitOfMeasureId'] ?? 0,
              description: productionTypeData['description'] ?? '',
              createdBy: productionTypeData['createdBy'] ?? 0,
              dateCreated:
                  DateTime.parse(productionTypeData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
