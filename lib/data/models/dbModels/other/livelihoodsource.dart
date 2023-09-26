class LivelihoodSource {
  final int livelihoodSourceId;
  final String livelihoodSource;
  final String? desc;
  final DateTime dateCreated;
  final int? createdBy;

  LivelihoodSource({
    required this.livelihoodSourceId,
    required this.livelihoodSource,
    this.desc,
    required this.dateCreated,
    this.createdBy,
  });
}
