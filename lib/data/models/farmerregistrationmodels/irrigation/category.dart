class FarmerIrrigationCategory {
  final int irrigationCropId;
  final int farmerId;
  final int irrigationCategoryId;
  final String? irrigationProjectName;
  final int? membershipTypeId;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerIrrigationCategory({
    required this.irrigationCropId,
    required this.farmerId,
    required this.irrigationCategoryId,
    this.irrigationProjectName,
    this.membershipTypeId,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerIrrigationCategory.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerIrrigationCategory(
        irrigationCropId: map['irrigation_crop_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        irrigationCategoryId: map['irrigation_category_id']?.toInt() ?? 0,
        irrigationProjectName: map['irrigation_project_name'] ?? '',
        membershipTypeId: map['membership_type_id']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
