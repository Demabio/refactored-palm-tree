class FarmerFertiliserSource {
  final int farmerFertSourceId;
  final int farmerId;
  final int farmerFarmId;
  final int farmerCropId;
  final int fertSourceId;
  final String? otherSource;
  final double? distanceSource;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerFertiliserSource({
    required this.farmerFertSourceId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.farmerCropId,
    required this.fertSourceId,
    this.otherSource,
    this.distanceSource,
    this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerFertSourceId': farmerFertSourceId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'farmerCropId': farmerCropId,
      'fertSourceId': fertSourceId,
      'otherSource': otherSource,
      'distanceSource': distanceSource,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerFertiliserSource.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerFertiliserSource(
        farmerFertSourceId: map['farmer_fert_source_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmerCropId: map['farmer_crop_id']?.toInt() ?? 0,
        fertSourceId: map['fert_source_id']?.toInt() ?? 0,
        otherSource: map['other_source'],
        distanceSource: map['distance_source']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
