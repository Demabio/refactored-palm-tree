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
  static List<AgriInfoSource> parseAgriInfoSources(Map<String, dynamic> json) {
    final agriInfoSourcesList =
        json['data']['getallAgriInfoSource'] as List<dynamic>;

    return agriInfoSourcesList
        .map((sourceData) => AgriInfoSource(
              agriInfoSourceId: sourceData['agriInfoSourceId'] ?? 0,
              agriInfoSource: sourceData['agriInfoSource'] ?? '',
              description: sourceData['desc'] ?? '',
              dateCreated: DateTime.parse(sourceData['dateCreated'] ?? ''),
              createdBy: sourceData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
