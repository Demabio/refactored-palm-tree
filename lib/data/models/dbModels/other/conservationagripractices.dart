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
}
