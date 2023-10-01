class FishType {
  final int fishTypeId;
  final int fishCategoryId;
  final String fishType;
  final String fishCode;
  final bool? commonFish;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FishType({
    required this.fishTypeId,
    required this.fishCategoryId,
    required this.fishType,
    required this.fishCode,
    this.commonFish,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FishType.fromSqfliteDatabase(Map<String, dynamic> map) => FishType(
        fishTypeId: map['fishTypeId']?.toInt() ?? 0,
        fishCategoryId: map['fishCategoryId']?.toInt() ?? 0,
        fishType: map['fishType'] ?? '',
        fishCode: map['fishCode'] ?? '',
        commonFish: map['commonFish'] ?? false,
        description: map['description'],
        dateCreated: DateTime.parse(map['dateCreated'] ?? ''),
        createdBy: map['createdBy']?.toInt(),
      );

  static List<FishType> parseFishList(Map<String, dynamic> json) {
    final fishList = json['data']['getallFish'] as List<dynamic>;

    return fishList
        .map((fishData) => FishType(
              fishTypeId: fishData['fishTypeId'] ?? 0,
              fishCategoryId: fishData['fishCategoryId'] ?? 0,
              fishType: fishData['fishType'] ?? '',
              fishCode: fishData['fishCode'] ?? '',
              commonFish: fishData['commonFish'] ?? false,
              description: fishData['description'] ?? '',
              dateCreated: DateTime.parse(fishData['dateCreated'] ?? ''),
              createdBy: fishData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
