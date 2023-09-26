class AgriPractice {
  final int agriPracticeId;
  final String agriPractice;
  final DateTime dateCreated;
  final int? createdBy;

  AgriPractice({
    required this.agriPracticeId,
    required this.agriPractice,
    required this.dateCreated,
    this.createdBy,
  });

  factory AgriPractice.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AgriPractice(
        agriPracticeId: map['agri_practice_id']?.toInt() ?? 0,
        agriPractice: map['agri_practice'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
