class Crop {
  final int cropId;
  final int cropCategoryId;
  final String crop;
  final String cropCode;
  final String commonCrop;
  final DateTime dateCreated;
  final String createdBy;

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
        commonCrop: map['common_crop'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? '',
      );
}
