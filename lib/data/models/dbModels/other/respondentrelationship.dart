class RespondentRelationship {
  final int respondendRlshpId;
  final String rlshpToFarmer;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  RespondentRelationship({
    required this.respondendRlshpId,
    required this.rlshpToFarmer,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
