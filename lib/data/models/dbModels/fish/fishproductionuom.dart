class FishProductionUnitOfMeasure {
  final int unitOfMeasureId;
  final String unitOfMeasure;

  FishProductionUnitOfMeasure({
    required this.unitOfMeasureId,
    required this.unitOfMeasure,
  });

  factory FishProductionUnitOfMeasure.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FishProductionUnitOfMeasure(
        unitOfMeasureId: map['unit_of_measure_id']?.toInt() ?? 0,
        unitOfMeasure: map['unit_of_measure'] ?? '',
      );
  static List<FishProductionUnitOfMeasure> parseFishProductionUOM(
      Map<String, dynamic> json) {
    final fishProductionUOMList =
        json['data']['getallFishProductionUOM'] as List<dynamic>;

    return fishProductionUOMList
        .map((productionUOMData) => FishProductionUnitOfMeasure(
              unitOfMeasureId: productionUOMData['unitOfMeasureId'] ?? 0,
              unitOfMeasure: productionUOMData['unitOfMeasure'] ?? '',
            ))
        .toList();
  }
}
