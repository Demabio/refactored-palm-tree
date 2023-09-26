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
}
