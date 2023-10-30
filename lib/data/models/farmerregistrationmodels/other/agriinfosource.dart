class FarmerAgriInfoSource {
  final int farmerAgriInfoSourceId;
  final int agriInfoSourceId;
  final int farmerId;
  final int? enumeratorId;

  FarmerAgriInfoSource({
    required this.farmerAgriInfoSourceId,
    required this.agriInfoSourceId,
    required this.farmerId,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerAgriInfoSourceId': farmerAgriInfoSourceId,
      'agriInfoSourceId': agriInfoSourceId,
      'farmerId': farmerId,
    };
  }

  factory FarmerAgriInfoSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerAgriInfoSource(
        farmerAgriInfoSourceId: map['farmer_agri_info_source_id']?.toInt() ?? 0,
        agriInfoSourceId: map['agri_info_source_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
      );
}
