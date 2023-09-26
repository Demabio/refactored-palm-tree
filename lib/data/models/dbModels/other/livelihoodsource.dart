class LivelihoodSource {
  final int livelihoodSourceId;
  final String livelihoodSource;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  LivelihoodSource({
    required this.livelihoodSourceId,
    required this.livelihoodSource,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory LivelihoodSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivelihoodSource(
        livelihoodSourceId: map['livelihood_source_id']?.toInt() ?? 0,
        livelihoodSource: map['livelihood_source'] ?? '',
        description: map['desc'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
