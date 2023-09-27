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
  static List<HouseholdRelationship> parseHouseholdRelationships(
      Map<String, dynamic> json) {
    final householdRelationshipsList =
        json['data']['getallHouseholdRelationship'] as List<dynamic>;

    return householdRelationshipsList
        .map((relationshipData) => HouseholdRelationship(
              hhRlshpId: relationshipData['hhRlshpId'] ?? 0,
              rlshpToHead: relationshipData['rlshpToHead'] ?? '',
              description: relationshipData['description'] ?? '',
              dateCreated:
                  DateTime.parse(relationshipData['dateCreated'] ?? ''),
              createdBy: relationshipData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
