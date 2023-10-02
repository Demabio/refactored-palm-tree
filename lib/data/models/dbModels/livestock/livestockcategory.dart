class LivestockCategory {
  final int livestockCatId;
  final String livestockCategory;
  final String livestockCategoryCode;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockCategory({
    required this.livestockCatId,
    required this.livestockCategory,
    required this.livestockCategoryCode,
    required this.dateCreated,
    this.createdBy,
  });

  factory LivestockCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivestockCategory(
        livestockCatId: map['livestock_cat_id']?.toInt() ?? 0,
        livestockCategory: map['livestock_category'] ?? '',
        livestockCategoryCode: map['livestock_category_code'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by']),
      );
  static List<LivestockCategory> parseLivestockCategories(
      Map<String, dynamic> json) {
    final livestockCategoriesList =
        json['data']['getAllLivestockCategories'] as List<dynamic>;

    return livestockCategoriesList
        .map((categoryData) => LivestockCategory(
              livestockCatId: categoryData['livestockCatId'] ?? 0,
              livestockCategory: categoryData['livestockCategory'] ?? '',
              livestockCategoryCode:
                  categoryData['livestockCategoryCode'] ?? '',
              createdBy: categoryData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(categoryData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
