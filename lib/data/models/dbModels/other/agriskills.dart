class AgriManagementSkill {
  final int agriSkillsId;
  final String agriSkills;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  AgriManagementSkill({
    required this.agriSkillsId,
    required this.agriSkills,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory AgriManagementSkill.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AgriManagementSkill(
        agriSkillsId: map['agri_skills_id']?.toInt() ?? 0,
        agriSkills: map['agri_skills'] ?? '',
        description: map['desc'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
  static List<AgriManagementSkill> parseAgriManagementSkills(
      Map<String, dynamic> json) {
    final agriManagementSkillsList =
        json['data']['getallAgriManagementSkills'] as List<dynamic>;

    return agriManagementSkillsList
        .map((skillData) => AgriManagementSkill(
              agriSkillsId: skillData['agriSkillsId'] ?? 0,
              agriSkills: skillData['agriSkills'] ?? '',
              dateCreated: DateTime.parse(skillData['dateCreated'] ?? ''),
              createdBy: skillData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
