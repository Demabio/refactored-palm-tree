class AgriInfoSource {
  final int agriInfoSourceId;
  final String agriInfoSource;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  AgriInfoSource({
    required this.agriInfoSourceId,
    required this.agriInfoSource,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory AgriInfoSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AgriInfoSource(
        agriInfoSourceId: map['agri_info_source_id']?.toInt() ?? 0,
        agriInfoSource: map['agri_info_source'] ?? '',
        description: map['desc'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
