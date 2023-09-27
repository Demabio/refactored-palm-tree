class FertilizerSource {
  final int fertSourceId;
  final String source;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FertilizerSource({
    required this.fertSourceId,
    required this.source,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FertilizerSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FertilizerSource(
        fertSourceId: map['fert_source_id']?.toInt() ?? 0,
        source: map['source'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );

  static List<FertilizerSource> parseFertiliserSources(
      Map<String, dynamic> json) {
    final fertiliserSourcesList =
        json['data']['getallFertiliserSources'] as List<dynamic>;

    return fertiliserSourcesList
        .map((sourceData) => FertilizerSource(
              fertSourceId: sourceData['fertSourceId'] ?? 0,
              source: sourceData['source'] ?? '',
              description: sourceData['description'] ?? '',
              createdBy: sourceData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(sourceData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
