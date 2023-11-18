class FarmerLivestock {
  int farmerLivestockId;
  int farmerId;
  int farmerFarmId;
  int? livestockFarmsystemCatId;
  int? livestockId;
  int? noOfBeehives;
  DateTime? dateCreated;
  int? createdBy;
  final int? enumeratorId;
  String? other;

  FarmerLivestock({
    required this.farmerLivestockId,
    required this.farmerId,
    required this.farmerFarmId,
    this.livestockFarmsystemCatId,
    this.livestockId,
    this.noOfBeehives,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
    this.other,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerLivestockId': farmerLivestockId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'livestockFarmsystemCatId': livestockFarmsystemCatId,
      'livestockId': livestockId,
      'noOfBeehives': noOfBeehives,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
      'enumeratorId': enumeratorId,
      'other': other,
    };
  }

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
        other: map['other'] ?? '',
      );
}
