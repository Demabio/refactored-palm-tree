class FarmerFishProductionLevel {
  final int farmerProductionLevelId;
  final int farmerId;
  final int farmerFarmId;
  final int productionLevelId;
  final bool fertilizerInPonds;
  final int espBenefit;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerFishProductionLevel({
    required this.farmerProductionLevelId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.productionLevelId,
    required this.fertilizerInPonds,
    required this.espBenefit,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerFishProductionLevel.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerFishProductionLevel(
        farmerProductionLevelId:
            map['farmer_production_level_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        productionLevelId: map['production_level_id']?.toInt() ?? 0,
        fertilizerInPonds: map['fertilizer_in_ponds'] == 1,
        espBenefit: map['esp_benefit']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
