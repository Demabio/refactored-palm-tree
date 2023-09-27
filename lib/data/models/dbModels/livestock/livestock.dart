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
  static List<Livestock> parseLivestocks(Map<String, dynamic> json) {
    final livestockList = json['data']['getAllLivestocks'] as List<dynamic>;

    return livestockList
        .map((livestockData) => Livestock(
              livestockId: livestockData['livestockId'] ?? 0,
              livestock: livestockData['livestock'] ?? '',
              livestockCode: livestockData['livestockCode'] ?? '',
              livestockSubCatId: livestockData['livestockSubCatId'] ?? 0,
              commonLivestock: livestockData['commonLivestock'] ?? false,
              dateCreated: DateTime.parse(livestockData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
