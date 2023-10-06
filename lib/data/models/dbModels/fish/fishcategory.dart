class FishCategory {
  final int fishCategoryId;
  final String fishCategory;
  final String fishCategoryCode;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FishCategory({
    required this.fishCategoryId,
    required this.fishCategory,
    required this.fishCategoryCode,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FishCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FishCategory(
        fishCategoryId: map['fish_category_id']?.toInt() ?? 0,
        fishCategory: map['fish_category'] ?? '',
        fishCategoryCode: map['fish_category_code'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );

  static List<FishCategory> parseFishCategories(Map<String, dynamic> json) {
    final fishCategoriesList =
        json['data']['getallFishCategories'] as List<dynamic>;

    return fishCategoriesList
        .map((categoryData) => FishCategory(
              fishCategoryId: categoryData['fishCategoryId'] ?? 0,
              fishCategory: categoryData['fishCategory'] ?? '',
              fishCategoryCode: categoryData['fishCategoryCode'] ?? '',
              description: categoryData['description'] ?? '',
              createdBy: categoryData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(categoryData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
