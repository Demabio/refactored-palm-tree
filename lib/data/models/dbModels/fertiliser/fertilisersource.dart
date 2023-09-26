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
}
