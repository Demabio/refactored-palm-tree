class LivestockFarmSystemCategory {
  final int livestockFarmsystemCatId;
  final int livestockCatId;
  final int livestockFarmsystemId;
  final String livestockFarmsysCatCode;
  final DateTime dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  LivestockFarmSystemCategory({
    required this.livestockFarmsystemCatId,
    required this.livestockCatId,
    required this.livestockFarmsystemId,
    required this.livestockFarmsysCatCode,
    required this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'livestockFarmsystemCatId': livestockFarmsystemCatId,
      'livestockCatId': livestockCatId,
      'livestockFarmsystemId': livestockFarmsystemId,
      'livestockFarmsysCatCode': livestockFarmsysCatCode,
      'dateCreated': dateCreated.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory LivestockFarmSystemCategory.fromSqfliteDatabase(
      Map<String, dynamic> map) {
    return LivestockFarmSystemCategory(
      livestockFarmsystemCatId:
          map['livestock_farmsystem_cat_id']?.toInt() ?? 0,
      livestockCatId: map['livestock_cat_id']?.toInt() ?? 0,
      livestockFarmsystemId: map['livestock_farmsystem_id']?.toInt() ?? 0,
      livestockFarmsysCatCode: map['livestock_farmsys_cat_code'] ?? '',
      dateCreated: DateTime.parse(map['date_created'] ?? ''),
      createdBy: map['created_by']?.toInt(),
    );
  }
}
