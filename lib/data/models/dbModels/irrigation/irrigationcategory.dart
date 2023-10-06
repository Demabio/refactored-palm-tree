class IrrigationCategory {
  final int irrigationCategoryId;
  final String irrigationCategory;
  final DateTime dateCreated;
  final int? createdBy;

  IrrigationCategory({
    required this.irrigationCategoryId,
    required this.irrigationCategory,
    required this.dateCreated,
    this.createdBy,
  });

  factory IrrigationCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      IrrigationCategory(
        irrigationCategoryId: map['irrigation_category_id']?.toInt() ?? 0,
        irrigationCategory: map['irrigation_category'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<IrrigationCategory> parseIrrigationCategories(
      Map<String, dynamic> json) {
    final irrigationCategoriesList =
        json['data']['getallIrrigationCategories'] as List<dynamic>;

    return irrigationCategoriesList
        .map((categoryData) => IrrigationCategory(
              irrigationCategoryId: categoryData['irrigationCategoryId'] ?? 0,
              irrigationCategory: categoryData['irrigationCategory'] ?? '',
              createdBy: categoryData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(categoryData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
