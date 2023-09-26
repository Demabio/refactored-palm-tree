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
}
