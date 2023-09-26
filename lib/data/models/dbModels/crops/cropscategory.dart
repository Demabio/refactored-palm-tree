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
}
