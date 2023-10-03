class FarmerFish {
  final int farmerFishId;
  final int farmerId;
  final int farmerFarmId;
  final int fishTypeId;
  final int productionTypeId;
  final int noOfFingerlings;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerFish({
    required this.farmerFishId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.fishTypeId,
    required this.productionTypeId,
    required this.noOfFingerlings,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerFish.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFish(
        farmerFishId: map['farmer_fish_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        fishTypeId: map['fish_type_id']?.toInt() ?? 0,
        productionTypeId: map['production_type_id']?.toInt() ?? 0,
        noOfFingerlings: map['no_of_fingerlings']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}