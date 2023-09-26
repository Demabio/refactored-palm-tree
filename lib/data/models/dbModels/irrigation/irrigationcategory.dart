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
}
