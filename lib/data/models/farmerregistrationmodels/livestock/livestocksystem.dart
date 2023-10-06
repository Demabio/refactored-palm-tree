class FarmerLivestockFarmSystem {
  final int farmerLivestockFarmSystemId;
  final int farmerId;
  final int livestockFarmSystemCatId;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerLivestockFarmSystem({
    required this.farmerLivestockFarmSystemId,
    required this.farmerId,
    required this.livestockFarmSystemCatId,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerLivestockFarmSystem.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerLivestockFarmSystem(
        farmerLivestockFarmSystemId:
            map['farmer_livestock_farmsystem_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        livestockFarmSystemCatId:
            map['livestock_farmsystem_cat_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
