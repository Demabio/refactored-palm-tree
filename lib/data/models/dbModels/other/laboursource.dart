class LabourSource {
  final int labourSourceId;
  final String labourSource;
  final String? desc;
  final DateTime dateCreated;
  final int? createdBy;

  LabourSource({
    required this.labourSourceId,
    required this.labourSource,
    this.desc,
    required this.dateCreated,
    this.createdBy,
  });
}
