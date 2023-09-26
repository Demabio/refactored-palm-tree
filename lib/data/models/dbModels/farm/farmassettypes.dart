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
}
