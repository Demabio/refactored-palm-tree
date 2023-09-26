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
}
