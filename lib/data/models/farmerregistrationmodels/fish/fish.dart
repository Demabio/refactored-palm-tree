class FarmerFish {
  int farmerFishId;
  int farmerId;
  int farmerFarmId;
  int fishTypeId;
  int? productionTypeId;
  int? noOfFingerlings;
  DateTime? dateCreated;
  int? createdBy;

  FarmerFish({
    required this.farmerFishId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.fishTypeId,
    this.productionTypeId,
    this.noOfFingerlings,
    this.dateCreated,
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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
