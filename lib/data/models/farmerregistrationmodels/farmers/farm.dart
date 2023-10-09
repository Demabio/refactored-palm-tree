class FarmerFarm {
  int farmerFarmId;
  int farmerId;
  int? ownershipId;
  String? farmName;
  String? farmLrCert;
  double? farmSize;
  double? cropFarmSize;
  double? livestockFarmSize;
  double? leasedFarmSize;
  double? idleFarmSize;
  int? areaUnitId;
  int? leaseYears;
  double? x;
  double? y;
  double? accuracyLevel;
  bool? otherFarmElsewhere;
  DateTime? dateCreated;
  int? createdBy;

  FarmerFarm({
    required this.farmerFarmId,
    required this.farmerId,
    this.ownershipId,
    this.farmName,
    this.farmLrCert,
    this.farmSize,
    this.cropFarmSize,
    this.livestockFarmSize,
    this.leasedFarmSize,
    this.idleFarmSize,
    this.areaUnitId,
    this.leaseYears,
    this.x,
    this.y,
    this.accuracyLevel,
    this.otherFarmElsewhere,
    this.dateCreated,
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
        livestockFarmSize: map['livestock_farm_size']?.toDouble(),
        leasedFarmSize: map['leased_farm_size']?.toDouble(),
        idleFarmSize: map['idle_farm_size']?.toDouble(),
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        leaseYears: map['lease_years']?.toInt(),
        x: map['x']?.toDouble(),
        y: map['y']?.toDouble(),
        accuracyLevel: map['accuracy_level']?.toDouble(),
        otherFarmElsewhere: map['other_farm_elsewhere'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
