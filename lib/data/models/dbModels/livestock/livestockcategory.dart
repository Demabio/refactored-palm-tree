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
        createdBy: map['created_by']?.toInt(),
      );
}
