class CropAreaUnit {
  final int areaUnitId;
  final String areaUnit;
  final DateTime dateCreated;
  final int? createdBy;

  CropAreaUnit({
    required this.areaUnitId,
    required this.areaUnit,
    required this.dateCreated,
    this.createdBy,
  });

  factory CropAreaUnit.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CropAreaUnit(
        areaUnitId: map['area_unit_id']?.toInt() ?? 0,
        areaUnit: map['area_unit'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
  static List<CropAreaUnit> parseCropAreaUnits(Map<String, dynamic> json) {
    final areaUnitsList = json['data']['getallCropAreaUnits'] as List<dynamic>;

    return areaUnitsList
        .map((areaUnitData) => CropAreaUnit(
              areaUnitId: areaUnitData['areaUnitId'] ?? 0,
              areaUnit: areaUnitData['areaUnit'] ?? '',
              createdBy: areaUnitData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(areaUnitData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
