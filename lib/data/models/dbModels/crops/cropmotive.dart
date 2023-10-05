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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<CropPlantingMotive> parseCropPlantingMotive(
      Map<String, dynamic> json) {
    final plantingMotivesList =
        json['data']['getallCropPlantingMotive'] as List<dynamic>;

    return plantingMotivesList
        .map((plantingMotiveData) => CropPlantingMotive(
              cropMotiveId: plantingMotiveData['cropMotiveId'] ?? 0,
              cropMotive: plantingMotiveData['cropMotive'] ?? '',
              createdBy: plantingMotiveData['createdBy'] ?? 0,
              dateCreated:
                  DateTime.parse(plantingMotiveData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
