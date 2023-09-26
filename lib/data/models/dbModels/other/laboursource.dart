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
        createdBy: map['created_by']?.toInt(),
      );
}
