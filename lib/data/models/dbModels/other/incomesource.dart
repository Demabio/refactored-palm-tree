class IncomeSource {
  final int incomeSourceId;
  final String incomeSource;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  IncomeSource({
    required this.incomeSourceId,
    required this.incomeSource,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
