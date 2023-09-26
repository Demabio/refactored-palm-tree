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
        createdBy: map['created_by']?.toInt(),
      );
}
