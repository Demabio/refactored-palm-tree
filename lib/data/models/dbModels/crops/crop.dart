class Crop {
  final int cropId;
  final int cropCategoryId;
  final String crop;
  final String cropCode;
  final bool commonCrop;
  final DateTime dateCreated;
  final int createdBy;

  Crop({
    required this.cropId,
    required this.cropCategoryId,
    required this.crop,
    required this.cropCode,
    required this.commonCrop,
    required this.dateCreated,
    required this.createdBy,
  });

  factory Crop.fromSqfliteDatabase(Map<String, dynamic> map) => Crop(
        cropId: map['crop_id']?.toInt() ?? 0,
        cropCategoryId: map['crop_cat_id']?.toInt() ?? 0,
        crop: map['crop'] ?? '',
        cropCode: map['crop_code'] ?? '',
        commonCrop: (map['common_crop'] ?? 0) == 1,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );

  factory Crop.fromJson(Map<String, dynamic> json) {
    final data = json['data']['getCropByID'][0]; // Extract the relevant data
    return Crop(
      cropId: data['cropId'] ?? 0,
      cropCategoryId: data['cropCatId'] ?? 0,
      crop: data['crop'] ?? '',
      cropCode: data['cropCode'] ?? '',
      commonCrop: data['commonCrop'] ?? '',
      dateCreated: DateTime.parse(data['dateCreated'] ?? ''),
      createdBy: data['createdBy'] ?? 0,
    );
  }
  static List<Crop> fromJsonList(Map<String, dynamic> json) {
    final cropList = json['data']['getallCrops'] as List<dynamic>;

    return cropList
        .map((cropData) => Crop(
              cropId: cropData['cropId'] ?? 0,
              cropCategoryId: cropData['cropCatId'] ?? 0,
              crop: cropData['crop'] ?? '',
              cropCode: cropData['cropCode'] ?? '',
              commonCrop: cropData['commonCrop'] ?? '',
              dateCreated: DateTime.parse(cropData['dateCreated'] ?? ''),
              createdBy: cropData['createdBy'] ?? 0,
            ))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final data = {
      'cropId': cropId,
      'cropCategoryId': cropCategoryId,
      'crop': crop,
      'cropCode': cropCode,
      'commonCrop': commonCrop,
      'dateCreated': dateCreated.toIso8601String(),
      'createdBy': createdBy,
    };
    return {
      'data': {
        'getallCropsDapper': [data]
      }
    };
  }
}
