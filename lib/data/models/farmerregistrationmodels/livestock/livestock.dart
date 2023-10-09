class FarmerLivestock {
  int farmerLivestockId;
  int farmerId;
  int farmerFarmId;
  int? livestockFarmsystemCatId;
  int? livestockId;
  int? noOfBeehives;
  DateTime? dateCreated;
  int? createdBy;

  FarmerLivestock({
    required this.farmerLivestockId,
    required this.farmerId,
    required this.farmerFarmId,
    this.livestockFarmsystemCatId,
    this.livestockId,
    this.noOfBeehives,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerLivestock.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerLivestock(
        farmerLivestockId: map['farmer_livestock_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        livestockFarmsystemCatId: map['livestock_farmsystem_cat_id']?.toInt(),
        livestockId: map['livestock_id']?.toInt() ?? 0,
        noOfBeehives: map['no_of_beehives']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
