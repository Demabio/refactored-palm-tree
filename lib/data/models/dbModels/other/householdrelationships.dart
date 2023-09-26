class HouseholdRelationship {
  final int hhRlshpId;
  final String rlshpToHead;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  HouseholdRelationship({
    required this.hhRlshpId,
    required this.rlshpToHead,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
