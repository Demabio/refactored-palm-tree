class FarmerLivestockService {
  final int farmerLivestockServicesId;
  final int farmerId;
  final int farmerFarmId;
  final double? livestockArea;
  final int? areaUnitId;
  final bool? fertilizerForFodder;
  final bool? fodderSeeds;
  final bool? fertilizerSeeds;
  final int? aiUse;
  final int? hormoneUse;
  final bool? embryoTransfer;
  final bool? routineVaccination;
  final bool? curativeMeasures;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerLivestockService({
    required this.farmerLivestockServicesId,
    required this.farmerId,
    required this.farmerFarmId,
    this.livestockArea,
    this.areaUnitId,
    this.fertilizerForFodder,
    this.fodderSeeds,
    this.fertilizerSeeds,
    this.aiUse,
    this.hormoneUse,
    this.embryoTransfer,
    this.routineVaccination,
    this.curativeMeasures,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerLivestockService.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerLivestockService(
        farmerLivestockServicesId:
            map['farmer_livestock_services_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        livestockArea: map['livestock_area']?.toDouble() ?? 0.0,
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        fertilizerForFodder: (map['fertilizer_for_fodder'] ?? 0) == 1,
        fodderSeeds: (map['fodder_seeds'] ?? 0) == 1,
        fertilizerSeeds: (map['fertilizer_seeds'] ?? 0) == 1,
        aiUse: map['ai_use']?.toInt() ?? 0,
        hormoneUse: map['hormone_use']?.toInt() ?? 0,
        embryoTransfer: (map['embryo_transfer'] ?? 0) == 1,
        routineVaccination: (map['routine_vaccination'] ?? 0) == 1,
        curativeMeasures: (map['curative_measures'] ?? 0) == 1,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
