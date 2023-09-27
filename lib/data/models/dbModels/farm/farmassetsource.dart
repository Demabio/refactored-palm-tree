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

  static List<FarmAssetSource> parseFarmAssetSources(
      Map<String, dynamic> json) {
    final farmAssetSourcesList =
        json['data']['getallFarmAssetSources'] as List<dynamic>;

    return farmAssetSourcesList
        .map((assetSourceData) => FarmAssetSource(
              assetSourceId: assetSourceData['assetSourceId'] ?? 0,
              assetSource: assetSourceData['assetSource'] ?? '',
              description: assetSourceData['description'] ?? '',
            ))
        .toList();
  }
}
