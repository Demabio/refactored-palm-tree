class AgriInfoSource {
  final int agriInfoSourceId;
  final String agriInfoSource;
  final String? desc;
  final DateTime dateCreated;
  final int? createdBy;

  AgriInfoSource({
    required this.agriInfoSourceId,
    required this.agriInfoSource,
    this.desc,
    required this.dateCreated,
    this.createdBy,
  });
}
