class FarmerLivestock {
  final int farmerLivestockId;
  final int farmerId;
  final int farmerFarmId;
  final int? livestockFarmsystemCatId;
  final int livestockId;
  final int? noOfBeehives;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerLivestock({
    required this.farmerLivestockId,
    required this.farmerId,
    required this.farmerFarmId,
    this.livestockFarmsystemCatId,
    required this.livestockId,
    this.noOfBeehives,
    required this.dateCreated,
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
        createdBy: map['created_by']?.toInt(),
      );
}
