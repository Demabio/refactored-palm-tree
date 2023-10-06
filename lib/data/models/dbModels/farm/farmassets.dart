class FarmAsset {
  final int farmAssetId;
  final int assetTypeId;
  final String asset;
  final String assetCode;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;
  String? assetType;

  FarmAsset({
    required this.farmAssetId,
    required this.assetTypeId,
    required this.asset,
    required this.assetCode,
    this.description,
    required this.dateCreated,
    this.createdBy,
    this.assetType,
  });

  factory FarmAsset.fromSqfliteDatabase(Map<String, dynamic> map) => FarmAsset(
        farmAssetId: map['farm_asset_id']?.toInt() ?? 0,
        assetTypeId: map['asset_type_id']?.toInt() ?? 0,
        asset: map['asset'] ?? '',
        assetCode: map['asset_code'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );

  factory FarmAsset.fromSqfliteDatabaseJoined(Map<String, dynamic> map) =>
      FarmAsset(
        farmAssetId: map['farm_asset_id']?.toInt() ?? 0,
        assetTypeId: map['asset_type_id']?.toInt() ?? 0,
        asset: map['asset'] ?? '',
        assetCode: map['asset_code'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
        assetType: map['asset_type'] ?? '',
      );
  static List<FarmAsset> parseFarmAssets(Map<String, dynamic> json) {
    final farmAssetsList = json['data']['getallFarmAssets'] as List<dynamic>;

    return farmAssetsList
        .map((assetData) => FarmAsset(
              farmAssetId: assetData['farmAssetId'] ?? 0,
              assetTypeId: assetData['assetTypeId'] ?? 0,
              asset: assetData['asset'] ?? '',
              assetCode: assetData['assetCode'] ?? '',
              description: assetData['description'] ?? '',
              createdBy: assetData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(assetData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
