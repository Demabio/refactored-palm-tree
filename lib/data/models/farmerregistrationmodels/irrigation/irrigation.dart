class FarmerIrrigation {
  final int farmerIrrigationId;
  final int farmerId;
  int farmerFarmId;

  final int? useIrrigation;
  final int? totalAreaIrrigation;
  final int? areaUnitId;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerIrrigation({
    required this.farmerIrrigationId,
    required this.farmerId,
    required this.farmerFarmId,
    this.useIrrigation,
    this.totalAreaIrrigation,
    this.areaUnitId,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerIrrigationId': farmerIrrigationId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'useIrrigation': useIrrigation,
      'totalAreaIrrigation': totalAreaIrrigation,
      'areaUnitId': areaUnitId,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerIrrigation.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIrrigation(
        farmerIrrigationId: map['farmer_irrigation_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        useIrrigation: map['use_irrigation']?.toInt(),
        totalAreaIrrigation: map['total_area_irrigation']?.toInt(),
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
