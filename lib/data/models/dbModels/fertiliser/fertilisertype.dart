class FertilizerType {
  final int fertiliserTypeId;
  final int fertiliserCategoryId;
  final String fertiliserType;
  final String? description;

  FertilizerType({
    required this.fertiliserTypeId,
    required this.fertiliserCategoryId,
    required this.fertiliserType,
    this.description,
  });
}
