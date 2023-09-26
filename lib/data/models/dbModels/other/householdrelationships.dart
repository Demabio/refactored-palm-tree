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

  factory HouseholdRelationship.fromSqfliteDatabase(Map<String, dynamic> map) =>
      HouseholdRelationship(
        hhRlshpId: map['hh_rlshp_id']?.toInt() ?? 0,
        rlshpToHead: map['rlshp_to_head'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
