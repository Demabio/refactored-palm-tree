class CropCategory {
  final int cropCategoryId;
  final String cropCategory;
  final String cropCategoryCode;
  final DateTime dateCreated;
  final int createdBy;

  CropCategory({
    required this.cropCategoryId,
    required this.cropCategory,
    required this.cropCategoryCode,
    required this.dateCreated,
    required this.createdBy,
  });

  factory CropCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropCategory(
        cropCategoryId: map['crop_cat_id']?.toInt() ?? 0,
        cropCategory: map['crop_category'] ?? '',
        cropCategoryCode: map['crop_category_code'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );

  static List<CropCategory> parseCropCategories(Map<String, dynamic> json) {
    final cropCategoriesList =
        json['data']['getallCropCategories'] as List<dynamic>;

    return cropCategoriesList
        .map((categoryData) => CropCategory(
              cropCategoryId: categoryData['cropCatId'] ?? 0,
              cropCategory: categoryData['cropCategory'] ?? '',
              cropCategoryCode:
                  categoryData['cropCategoryCode']?.toString() ?? '',
              dateCreated: DateTime.parse(categoryData['dateCreated'] ?? ''),
              createdBy: categoryData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
