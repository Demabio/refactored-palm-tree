class FarmerFishProductionLevel {
  int farmerProductionLevelId;
  int farmerId;
  int farmerFarmId;
  int productionLevelId;
  bool? fertilizerInPonds;
  int? espBenefit;
  DateTime? dateCreated;
  int? createdBy;
  final int? enumeratorId;

  FarmerFishProductionLevel({
    required this.farmerProductionLevelId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.productionLevelId,
    this.fertilizerInPonds,
    this.espBenefit,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerProductionLevelId': farmerProductionLevelId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'productionLevelId': productionLevelId,
      'fertilizerInPonds': fertilizerInPonds,
      'espBenefit': espBenefit,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerFishProductionLevel.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerFishProductionLevel(
        farmerProductionLevelId:
            map['farmer_production_level_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        productionLevelId: map['production_level_id']?.toInt() ?? 0,
        fertilizerInPonds: map['fertilizer_in_ponds'] == 1,
        espBenefit: int.parse(map['esp_benefit'] ?? "0"),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
