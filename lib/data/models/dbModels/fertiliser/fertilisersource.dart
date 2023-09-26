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
}
