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
}
