class FarmerIrrigationAgency {
  final int irrigationCropId;
  int farmerFarmId;
  final int farmerId;
  final int irrigationAgencyId;
  final String? agencyName;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerIrrigationAgency({
    required this.irrigationCropId,
    required this.farmerId,
    required this.irrigationAgencyId,
    required this.farmerFarmId,
    this.agencyName,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigationAgency.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerIrrigationAgency(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        irrigationAgencyId: map['irrigation_agency_id']?.toInt() ?? 0,
        agencyName: map['agency_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
