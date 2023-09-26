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
}
