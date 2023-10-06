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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<LivelihoodSource> parseLivelihoodSources(
      Map<String, dynamic> json) {
    final livelihoodSourcesList =
        json['data']['getallLivelihoodSource'] as List<dynamic>;

    return livelihoodSourcesList
        .map((sourceData) => LivelihoodSource(
              livelihoodSourceId: sourceData['livelihoodSourceId'] ?? 0,
              livelihoodSource: sourceData['livelihoodSource'] ?? '',
              description: sourceData['desc'] ?? '',
              dateCreated: DateTime.parse(sourceData['dateCreated'] ?? ''),
              createdBy: sourceData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
