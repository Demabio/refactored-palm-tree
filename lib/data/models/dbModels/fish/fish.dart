import 'package:intl/intl.dart';

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
        fishTypeId: map['fish_type_id']?.toInt() ?? 0,
        fishCategoryId: map['fish_category_id']?.toInt() ?? 0,
        fishType: map['fish_type'] ?? '',
        fishCode: map['fish_code'] ?? '',
        commonFish: map['common_fish'] ?? false,
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by']),
      );

  static List<FishType> parseFishList(Map<String, dynamic> json) {
    final fishList = json['data']['getallFish'] as List<dynamic>;

    final dateFormatter = DateFormat('yyyy-MM-ddTHH:mm:ss');

    return fishList
        .map((fishData) => FishType(
              fishTypeId: fishData['fishTypeId'] ?? 0,
              fishCategoryId: fishData['fishCategoryId'] ?? 0,
              fishType: fishData['fishType'] ?? '',
              fishCode: fishData['fishCode'] ?? '',
              commonFish: fishData['commonFish'] ?? false,
              description: fishData['description'] ?? '',
              dateCreated: dateFormatter.parse(fishData['dateCreated'] ?? ''),
              createdBy: fishData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
