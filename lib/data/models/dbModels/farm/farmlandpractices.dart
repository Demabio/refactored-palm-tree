class FarmlandPractice {
  final int landPracticeId;
  final String landPracticeName;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FarmlandPractice({
    required this.landPracticeId,
    required this.landPracticeName,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmlandPractice.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmlandPractice(
        landPracticeId: map['land_practice_id']?.toInt() ?? 0,
        landPracticeName: map['land_practice_name'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
