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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<AgriPractice> parseAgriPractices(Map<String, dynamic> json) {
    final agriPracticesList =
        json['data']['getallAgriPractice'] as List<dynamic>;

    return agriPracticesList
        .map((practiceData) => AgriPractice(
              agriPracticeId: practiceData['agriPracticeId'] ?? 0,
              agriPractice: practiceData['agriPractice'] ?? '',
              dateCreated: DateTime.parse(practiceData['dateCreated'] ?? ''),
              createdBy: practiceData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
