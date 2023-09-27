class CropSystem {
  final int cropSystemId;
  final String croppingSystem;
  final String description;

  CropSystem({
    required this.cropSystemId,
    required this.croppingSystem,
    required this.description,
  });

  factory CropSystem.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropSystem(
        cropSystemId: map['crop_system_id']?.toInt() ?? 0,
        croppingSystem: map['cropping_system'] ?? '',
        description: map['description'] ?? '',
      );
  static List<CropSystem> parseCropSystems(Map<String, dynamic> json) {
    final cropSystemsList = json['data']['getallCropSystems'] as List<dynamic>;

    return cropSystemsList
        .map((cropSystemData) => CropSystem(
              cropSystemId: cropSystemData['cropSystemId'] ?? 0,
              croppingSystem: cropSystemData['croppingSystem'] ?? '',
              description: cropSystemData['description'] ?? '',
            ))
        .toList();
  }
}
