class FarmAssetType {
  final int assetTypeId;
  final String asssetTypeCode;
  final String assetName;
  final String? description;

  FarmAssetType({
    required this.assetTypeId,
    required this.asssetTypeCode,
    required this.assetName,
    this.description,
  });

  factory FarmAssetType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmAssetType(
        assetTypeId: map['asset_type_id']?.toInt() ?? 0,
        asssetTypeCode: map['assset_type_code'] ?? '',
        assetName: map['asset_name'] ?? '',
        description: map['description'],
      );
}
