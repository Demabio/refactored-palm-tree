class Livestock {
  final int livestockId;
  final String livestock;
  final int livestockSubCatId;
  final String livestockCode;
  final bool commonLivestock;
  final DateTime dateCreated;
  final int? createdBy;
  final int? livestockCatId;
  final String? livestockCat;
  final String? livestockSubCat;

  Livestock({
    required this.livestockId,
    required this.livestock,
    required this.livestockSubCatId,
    required this.livestockCode,
    required this.commonLivestock,
    required this.dateCreated,
    this.createdBy,
    this.livestockCatId,
    this.livestockCat,
    this.livestockSubCat,
  });

  factory Livestock.fromSqfliteDatabase(Map<String, dynamic> map) => Livestock(
        livestockId: map['livestock_id']?.toInt() ?? 0,
        livestock: map['livestock'] ?? '',
        livestockSubCatId: map['livestock_sub_cat_id']?.toInt() ?? 0,
        livestockCode: map['livestock_code'] ?? '',
        commonLivestock: map['common_livestock'] == 1,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );

  factory Livestock.fromSqfliteDatabaseJoined(Map<String, dynamic> map) =>
      Livestock(
        livestockId: map['livestock_id']?.toInt() ?? 0,
        livestock: map['livestock'] ?? '',
        livestockSubCatId: map['livestock_sub_cat_id']?.toInt() ?? 0,
        livestockCode: map['livestock_code'] ?? '',
        commonLivestock: map['common_livestock'] == 1,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
        livestockCatId: map['livestock_cat_id']?.toInt() ?? 0,
        livestockCat: map['livestock_category'] ?? '',
        livestockSubCat: map['livestock_subcategory'] ?? '',
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
