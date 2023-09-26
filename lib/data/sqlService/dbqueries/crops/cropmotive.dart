class CropPlantingMotive {
  final int id;
  final int cropMotiveId;
  final String cropMotive;
  final DateTime dateCreated;
  final String createdBy;

  CropPlantingMotive({
    required this.id,
    required this.cropMotiveId,
    required this.cropMotive,
    required this.dateCreated,
    required this.createdBy,
  });

  factory CropPlantingMotive.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropPlantingMotive(
        id: map['id']?.toInt() ?? 0,
        cropMotiveId: map['crop_motive_id']?.toInt() ?? 0,
        cropMotive: map['crop_motive'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? '',
      );
}
