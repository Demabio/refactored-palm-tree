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
}
