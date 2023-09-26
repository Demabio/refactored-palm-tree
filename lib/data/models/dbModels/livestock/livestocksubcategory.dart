class LivestockSubcategory {
  final int livestockSubCatId;
  final int livestockCatId;
  final String livestockSubcategory;
  final String livestockSubcategoryCode;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockSubcategory({
    required this.livestockSubCatId,
    required this.livestockCatId,
    required this.livestockSubcategory,
    required this.livestockSubcategoryCode,
    required this.dateCreated,
    this.createdBy,
  });
}
