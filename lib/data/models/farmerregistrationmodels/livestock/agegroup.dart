class FarmerLivestockAgeGroup {
  final int farmerLivestockAgegroupId;
  final int farmerLivestockId;
  final int ageGroupId;
  final int? noOfLivestockMale;
  final int? noOfLivestockFemale;
  final DateTime dateCreated;
  final int createdBy;

  FarmerLivestockAgeGroup({
    required this.farmerLivestockAgegroupId,
    required this.farmerLivestockId,
    required this.ageGroupId,
    this.noOfLivestockMale,
    this.noOfLivestockFemale,
    required this.dateCreated,
    required this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerLivestockAgegroupId': farmerLivestockAgegroupId,
      'farmerLivestockId': farmerLivestockId,
      'ageGroupId': ageGroupId,
      'noOfLivestockMale': noOfLivestockMale,
      'noOfLivestockFemale': noOfLivestockFemale,
      'dateCreated': dateCreated.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerLivestockAgeGroup.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerLivestockAgeGroup(
        farmerLivestockAgegroupId:
            map['farmer_livestockagegroup_id']?.toInt() ?? 0,
        farmerLivestockId: map['farmer_livestock_id']?.toInt() ?? 0,
        ageGroupId: map['age_group_id']?.toInt() ?? 0,
        noOfLivestockMale: map['no_of_livestock_male']?.toInt(),
        noOfLivestockFemale: map['no_of_livestock_female']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt() ?? 0,
      );
}
