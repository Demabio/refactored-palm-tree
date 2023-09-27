class ExtensionSource {
  final int extensionSourceId;
  final String sourceType;
  final String? description;

  ExtensionSource({
    required this.extensionSourceId,
    required this.sourceType,
    this.description,
  });

  factory ExtensionSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      ExtensionSource(
        extensionSourceId: map['extension_source_id']?.toInt() ?? 0,
        sourceType: map['source_type'] ?? '',
        description: map['description'],
      );

  static List<ExtensionSource> parseExtensionSources(
      Map<String, dynamic> json) {
    final extensionSourcesList =
        json['data']['getallExtensionSources'] as List<dynamic>;

    return extensionSourcesList
        .map((sourceData) => ExtensionSource(
              extensionSourceId: sourceData['extensionSourceId'] ?? 0,
              sourceType: sourceData['sourceType'] ?? '',
              description: sourceData['description'] ?? '',
            ))
        .toList();
  }
}
