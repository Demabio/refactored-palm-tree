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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<IncomeSource> parseIncomeSources(Map<String, dynamic> json) {
    final incomeSourcesList =
        json['data']['getallIncomeSource'] as List<dynamic>;

    return incomeSourcesList
        .map((sourceData) => IncomeSource(
              incomeSourceId: sourceData['incomeSourceId'] ?? 0,
              incomeSource: sourceData['incomeSource'] ?? '',
              description: sourceData['description'] ?? '',
              dateCreated: DateTime.parse(sourceData['dateCreated'] ?? ''),
              createdBy: sourceData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
