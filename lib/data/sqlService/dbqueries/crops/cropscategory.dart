class CropCategory {
  final int id;
  final int cropCategoryId;
  final String cropCategory;
  final String cropCategoryCode;
  final DateTime dateCreated;
  final String createdBy;

  CropCategory({
    required this.id,
    required this.cropCategoryId,
    required this.cropCategory,
    required this.cropCategoryCode,
    required this.dateCreated,
    required this.createdBy,
  });

  factory CropCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropCategory(
        id: map['id']?.toInt() ?? 0,
        cropCategoryId: map['crop_cat_id']?.toInt() ?? 0,
        cropCategory: map['crop_category'] ?? '',
        cropCategoryCode: map['crop_category_code'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? '',
      );
}
