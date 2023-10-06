class LabourSource {
  final int labourSourceId;
  final String labourSource;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  LabourSource({
    required this.labourSourceId,
    required this.labourSource,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory LabourSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LabourSource(
        labourSourceId: map['labour_source_id']?.toInt() ?? 0,
        labourSource: map['labour_source'] ?? '',
        description: map['desc'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<LabourSource> parseLabourSources(Map<String, dynamic> json) {
    final labourSourcesList =
        json['data']['getallLabourSource'] as List<dynamic>;

    return labourSourcesList
        .map((sourceData) => LabourSource(
              labourSourceId: sourceData['labourSourceId'] ?? 0,
              labourSource: sourceData['labourSource'] ?? '',
              description: sourceData['desc'] ?? '',
              dateCreated: DateTime.parse(sourceData['dateCreated'] ?? ''),
              createdBy: sourceData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
