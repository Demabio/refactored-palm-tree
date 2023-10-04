class LivestockAgeGroup {
  final int ageGroupId;
  final String ageGroup;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockAgeGroup({
    required this.ageGroupId,
    required this.ageGroup,
    required this.dateCreated,
    this.createdBy,
  });

  factory LivestockAgeGroup.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivestockAgeGroup(
        ageGroupId: map['age_group_id']?.toInt() ?? 0,
        ageGroup: map['age_group'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by']),
      );
  static List<LivestockAgeGroup> parseAgeGroups(Map<String, dynamic> json) {
    final ageGroupsList = json['data']['getallAgeGroups'] as List<dynamic>;

    return ageGroupsList
        .map((ageGroupData) => LivestockAgeGroup(
              ageGroupId: ageGroupData['ageGroupId'] ?? 0,
              ageGroup: ageGroupData['ageGroup'] ?? '',
              createdBy: ageGroupData['createdBy'] ?? null,
              dateCreated: DateTime.parse(ageGroupData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
