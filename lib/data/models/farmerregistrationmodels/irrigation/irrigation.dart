class FarmerIrrigation {
  final int farmerIrrigationId;
  final int farmerId;
  final int? useIrrigation;
  final int? totalAreaIrrigation;
  final int areaUnitId;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerIrrigation({
    required this.farmerIrrigationId,
    required this.farmerId,
    this.useIrrigation,
    this.totalAreaIrrigation,
    required this.areaUnitId,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigation.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIrrigation(
        farmerIrrigationId: map['farmer_irrigation_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        useIrrigation: map['use_irrigation']?.toInt(),
        totalAreaIrrigation: map['total_area_irrigation']?.toInt(),
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
