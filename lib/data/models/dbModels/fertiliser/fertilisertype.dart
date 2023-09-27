class FertilizerType {
  final int fertiliserTypeId;
  final int fertiliserCategoryId;
  final String fertiliserType;
  final String? description;

  FertilizerType({
    required this.fertiliserTypeId,
    required this.fertiliserCategoryId,
    required this.fertiliserType,
    this.description,
  });

  factory FertilizerType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FertilizerType(
        fertiliserTypeId: map['fertiliser_type_id']?.toInt() ?? 0,
        fertiliserCategoryId: map['fertiliser_category_id']?.toInt() ?? 0,
        fertiliserType: map['fertiliser_type'] ?? '',
        description: map['description'],
      );
  static List<FertilizerType> parseFertiliserTypes(Map<String, dynamic> json) {
    final fertiliserTypesList =
        json['data']['getallFertiliserTypes'] as List<dynamic>;

    return fertiliserTypesList
        .map((typeData) => FertilizerType(
              fertiliserTypeId: typeData['fertiliserTypeId'] ?? 0,
              fertiliserCategoryId: typeData['fertiliserCategoryId'] ?? 0,
              fertiliserType: typeData['fertiliserType'] ?? '',
              description: typeData['description'] ?? '',
            ))
        .toList();
  }
}
