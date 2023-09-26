class FertilizerTypeCategory {
  final int fertiliserCategoryId;
  final String fertiliserCategory;
  final String? description;

  FertilizerTypeCategory({
    required this.fertiliserCategoryId,
    required this.fertiliserCategory,
    this.description,
  });

  factory FertilizerTypeCategory.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FertilizerTypeCategory(
        fertiliserCategoryId: map['fertiliser_category_id']?.toInt() ?? 0,
        fertiliserCategory: map['fertiliser_category'] ?? '',
        description: map['description'],
      );
}
