class FarmerFishProductionSystem {
  final int farmerFishprodId;
  final int farmerId;
  final int farmerFarmId;
  final int productionTypeId;
  final int? productionStatus;
  final double? activeArea;
  final int? noOfActiveUnits;
  final double? inactiveArea;
  final int? noOfInactiveUnits;
  final DateTime dateCreated;
  final int? createdBy;
  final int? enumeratorId;
  final String? other;

  FarmerFishProductionSystem({
    required this.farmerFishprodId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.productionTypeId,
    this.productionStatus,
    this.activeArea,
    this.noOfActiveUnits,
    this.inactiveArea,
    this.noOfInactiveUnits,
    required this.dateCreated,
    this.createdBy,
    this.enumeratorId,
    this.other,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerFishprodId': farmerFishprodId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'productionTypeId': productionTypeId,
      'productionStatus': productionStatus,
      'activeArea': activeArea,
      'noOfActiveUnits': noOfActiveUnits,
      'inactiveArea': inactiveArea,
      'noOfInactiveUnits': noOfInactiveUnits,
      'dateCreated': dateCreated.toIso8601String(),
      'createdBy': createdBy,
      'other': other,
    };
  }

  factory FarmerFishProductionSystem.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerFishProductionSystem(
        farmerFishprodId: map['farmer_fishprod_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        productionTypeId: map['production_type_id']?.toInt() ?? 0,
        productionStatus: int.parse(map['production_status'] ?? "0"),
        activeArea: map['active_area']?.toDouble(),
        noOfActiveUnits: map['no_of_active_units']?.toInt(),
        inactiveArea: map['inactive_area']?.toDouble(),
        noOfInactiveUnits: map['no_of_inactive_units']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
        other: map['other'] ?? '',
      );
}
