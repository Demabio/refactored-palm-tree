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
        createdBy: map['created_by']?.toInt(),
      );
}
