class Livestock {
  final int livestockId;
  final String livestock;
  final int livestockSubCatId;
  final String livestockCode;
  final bool commonLivestock;
  final DateTime dateCreated;
  final int? createdBy;

  Livestock({
    required this.livestockId,
    required this.livestock,
    required this.livestockSubCatId,
    required this.livestockCode,
    required this.commonLivestock,
    required this.dateCreated,
    this.createdBy,
  });

  factory Livestock.fromSqfliteDatabase(Map<String, dynamic> map) => Livestock(
        livestockId: map['livestock_id']?.toInt() ?? 0,
        livestock: map['livestock'] ?? '',
        livestockSubCatId: map['livestock_sub_cat_id']?.toInt() ?? 0,
        livestockCode: map['livestock_code'] ?? '',
        commonLivestock: map['common_livestock'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
