class FarmerAssetSource {
  int farmerAssetSource;
  int farmerId;
  int farmerFarmId;
  int assetSourceId;
  DateTime? dateCreated;
  int? createdBy;

  FarmerAssetSource({
    required this.farmerAssetSource,
    required this.farmerId,
    required this.farmerFarmId,
    required this.assetSourceId,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerAssetSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerAssetSource(
        farmerAssetSource: map['farmer_asset_source']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        assetSourceId: map['asset_source_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
