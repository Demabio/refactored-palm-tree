class FarmerFarm {
  final int farmerFarmId;
  final int farmerId;
  final int ownershipId;
  final String farmName;
  final String? farmLrCert;
  final double farmSize;
  final double? cropFarmSize;
  final double? leasedFarmSize;
  final double? idleFarmSize;
  final int areaUnitId;
  final int? leaseYears;
  final double? x;
  final double? y;
  final double? accuracyLevel;
  final bool? otherFarmElsewhere;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerFarm({
    required this.farmerFarmId,
    required this.farmerId,
    required this.ownershipId,
    required this.farmName,
    this.farmLrCert,
    required this.farmSize,
    this.cropFarmSize,
    this.leasedFarmSize,
    this.idleFarmSize,
    required this.areaUnitId,
    this.leaseYears,
    this.x,
    this.y,
    this.accuracyLevel,
    this.otherFarmElsewhere,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerFarm.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFarm(
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        ownershipId: map['ownership_id']?.toInt() ?? 0,
        farmName: map['farm_name'] ?? '',
        farmLrCert: map['farm_lr_cert'],
        farmSize: map['farm_size']?.toDouble() ?? 0.0,
        cropFarmSize: map['crop_farm_size']?.toDouble(),
        leasedFarmSize: map['leased_farm_size']?.toDouble(),
        idleFarmSize: map['idle_farm_size']?.toDouble(),
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        leaseYears: map['lease_years']?.toInt(),
        x: map['x']?.toDouble(),
        y: map['y']?.toDouble(),
        accuracyLevel: map['accuracy_level']?.toDouble(),
        otherFarmElsewhere: map['other_farm_elsewhere'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
