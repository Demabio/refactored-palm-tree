class AgriManagementSkill {
  final int agriSkillsId;
  final String agriSkills;
  final String? desc;
  final DateTime dateCreated;
  final int? createdBy;

  AgriManagementSkill({
    required this.agriSkillsId,
    required this.agriSkills,
    this.desc,
    required this.dateCreated,
    this.createdBy,
  });
}
