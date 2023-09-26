class FarmAssetSource {
  final int assetSourceId;
  final String assetSource;
  final String? description;

  FarmAssetSource({
    required this.assetSourceId,
    required this.assetSource,
    this.description,
  });

  factory FarmAssetSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmAssetSource(
        assetSourceId: map['asset_source_id']?.toInt() ?? 0,
        assetSource: map['asset_source'] ?? '',
        description: map['description'],
      );
}
