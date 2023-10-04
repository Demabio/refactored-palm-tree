class CooperativeGroup {
  final int cooperativeGroupId;
  final String group;
  final String? description;

  CooperativeGroup({
    required this.cooperativeGroupId,
    required this.group,
    this.description,
  });

  factory CooperativeGroup.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CooperativeGroup(
        cooperativeGroupId: map['cooperative_group_id']?.toInt() ?? 0,
        group: map['group'] ?? '',
        description: map['description'],
      );

  static List<CooperativeGroup> parseCooperativeGroups(
      Map<String, dynamic> json) {
    final cooperativeGroupsList =
        json['data']['getallCooperativeGroups'] as List<dynamic>;

    return cooperativeGroupsList
        .map((cooperativeGroupData) => CooperativeGroup(
              cooperativeGroupId:
                  cooperativeGroupData['cooperateiveGroupId'] ?? 0,
              group: cooperativeGroupData['group'] ?? '',
              description: cooperativeGroupData['description'] ?? '',
            ))
        .toList();
  }
}
