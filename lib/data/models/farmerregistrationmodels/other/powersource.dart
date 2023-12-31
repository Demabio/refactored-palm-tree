class FarmerPowerSource {
  int farmPowerSourceId;
  int farmerId;
  int farmerFarmId;
  int powerSourceId;
  String? othersName;
  DateTime? dateCreated;
  int? createdBy;
  final int? enumeratorId;

  FarmerPowerSource({
    required this.farmPowerSourceId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.powerSourceId,
    this.othersName,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmPowerSourceId': farmPowerSourceId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'powerSourceId': powerSourceId,
      'othersName': othersName,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerPowerSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerPowerSource(
        farmPowerSourceId: map['farm_power_source_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        powerSourceId: map['power_source_id']?.toInt() ?? 0,
        othersName: map['others_name'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
