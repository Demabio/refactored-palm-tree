class FarmAsset {
  final int farmAssetId;
  final int assetTypeId;
  final String asset;
  final String assetCode;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FarmAsset({
    required this.farmAssetId,
    required this.assetTypeId,
    required this.asset,
    required this.assetCode,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmAsset.fromSqfliteDatabase(Map<String, dynamic> map) => FarmAsset(
        farmAssetId: map['farm_asset_id']?.toInt() ?? 0,
        assetTypeId: map['asset_type_id']?.toInt() ?? 0,
        asset: map['asset'] ?? '',
        assetCode: map['asset_code'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
