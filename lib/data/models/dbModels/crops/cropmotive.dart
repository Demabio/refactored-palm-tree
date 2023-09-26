class CropPlantingMotive {
  final int cropMotiveId;
  final String cropMotive;
  final DateTime dateCreated;
  final int createdBy;

  CropPlantingMotive({
    required this.cropMotiveId,
    required this.cropMotive,
    required this.dateCreated,
    required this.createdBy,
  });

  factory CropPlantingMotive.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropPlantingMotive(
        cropMotiveId: map['crop_motive_id']?.toInt() ?? 0,
        cropMotive: map['crop_motive'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
