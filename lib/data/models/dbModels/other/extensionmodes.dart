class ExtensionMode {
  final int extensionModeId;
  final String sourceMode;
  final String? description;

  ExtensionMode({
    required this.extensionModeId,
    required this.sourceMode,
    this.description,
  });

  factory ExtensionMode.fromSqfliteDatabase(Map<String, dynamic> map) =>
      ExtensionMode(
        extensionModeId: map['extension_mode_id']?.toInt() ?? 0,
        sourceMode: map['source_mode'] ?? '',
        description: map['description'],
      );

  static List<ExtensionMode> parseExtensionModes(Map<String, dynamic> json) {
    final extensionModesList =
        json['data']['getallExtensionModes'] as List<dynamic>;

    return extensionModesList
        .map((extensionModeData) => ExtensionMode(
              extensionModeId: extensionModeData['extensionModeId'] ?? 0,
              sourceMode: extensionModeData['sourceMode'] ?? '',
              description: extensionModeData['description'] ?? '',
            ))
        .toList();
  }
}
