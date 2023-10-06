class FarmerPowerSource {
  final int farmPowerSourceId;
  final int farmerId;
  final int farmerFarmId;
  final int powerSourceId;
  final String? othersName;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerPowerSource({
    required this.farmPowerSourceId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.powerSourceId,
    this.othersName,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerPowerSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerPowerSource(
        farmPowerSourceId: map['farm_power_source_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        powerSourceId: map['power_source_id']?.toInt() ?? 0,
        othersName: map['others_name'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
