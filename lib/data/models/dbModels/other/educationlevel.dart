class EducationLevel {
  final int educationLevelId;
  final String educationLevel;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  EducationLevel({
    required this.educationLevelId,
    required this.educationLevel,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory EducationLevel.fromSqfliteDatabase(Map<String, dynamic> map) =>
      EducationLevel(
        educationLevelId: map['education_level_id']?.toInt() ?? 0,
        educationLevel: map['education_level'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
