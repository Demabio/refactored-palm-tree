class FarmerFishCategory {
  int farmerFishCategoryId;
  int farmerId;
  int farmerFarmId;
  int fishCategoryId;
  int? createdBy;
  DateTime? dateCreated;
  final int? enumeratorId;
  String? other;

  FarmerFishCategory({
    required this.farmerFishCategoryId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.fishCategoryId,
    this.createdBy,
    this.dateCreated,
    this.enumeratorId,
    this.other,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerFishCategoryId': farmerFishCategoryId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'fishCategoryId': fishCategoryId,
      'createdBy': createdBy,
      'dateCreated': dateCreated?.toIso8601String(),
      'other': other,
    };
  }

  factory FarmerFishCategory.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFishCategory(
        farmerFishCategoryId: map['farmer_fishcategory_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        fishCategoryId: map['fish_category_id']?.toInt() ?? 0,
        createdBy: map['created_by']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        other: map['other'] ?? '',
      );
}
