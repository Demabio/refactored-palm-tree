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
}
