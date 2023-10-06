class CreditSource {
  final int creditSourceId;
  final String creditSource;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  CreditSource({
    required this.creditSourceId,
    required this.creditSource,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory CreditSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CreditSource(
        creditSourceId: map['credit_source_id']?.toInt() ?? 0,
        creditSource: map['credit_source'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<CreditSource> parseCreditSources(Map<String, dynamic> json) {
    final creditSourcesList =
        json['data']['getallCreditSources'] as List<dynamic>;

    return creditSourcesList
        .map((creditSourceData) => CreditSource(
              creditSourceId: creditSourceData['creditSourceId'] ?? 0,
              creditSource: creditSourceData['creditSource'] ?? '',
              description: creditSourceData['description'] ?? '',
              dateCreated:
                  DateTime.parse(creditSourceData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
