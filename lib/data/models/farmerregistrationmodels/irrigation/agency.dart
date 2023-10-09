class FarmerIrrigationAgency {
  final int irrigationCropId;
  final int farmerId;
  final int irrigationAgencyId;
  final String? agencyName;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerIrrigationAgency({
    required this.irrigationCropId,
    required this.farmerId,
    required this.irrigationAgencyId,
    this.agencyName,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigationAgency.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerIrrigationAgency(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        irrigationAgencyId: map['irrigation_agency_id']?.toInt() ?? 0,
        agencyName: map['agency_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
