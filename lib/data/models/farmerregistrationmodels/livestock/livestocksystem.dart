class FarmerLivestockFarmSystem {
  int farmerLivestockFarmSystemId;
  int farmerId;
  int? livestockFarmSystemCatId;
  DateTime? dateCreated;
  int? createdBy;

  FarmerLivestockFarmSystem({
    required this.farmerLivestockFarmSystemId,
    required this.farmerId,
    required this.livestockFarmSystemCatId,
    required this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerLivestockFarmSystemId': farmerLivestockFarmSystemId,
      'farmerId': farmerId,
      'livestockFarmSystemCatId': livestockFarmSystemCatId,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

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
