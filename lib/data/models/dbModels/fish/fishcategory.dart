class FishCategory {
  final int fishCategoryId;
  final String fishCategory;
  final String fishCategoryCode;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FishCategory({
    required this.fishCategoryId,
    required this.fishCategory,
    required this.fishCategoryCode,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
