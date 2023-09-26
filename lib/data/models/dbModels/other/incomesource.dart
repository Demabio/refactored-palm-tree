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

  factory IncomeSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      IncomeSource(
        incomeSourceId: map['income_source_id']?.toInt() ?? 0,
        incomeSource: map['income_source'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
