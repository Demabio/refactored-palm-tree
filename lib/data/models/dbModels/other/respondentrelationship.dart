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

  factory RespondentRelationship.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      RespondentRelationship(
        respondendRlshpId: map['respondend_rlshp_id']?.toInt() ?? 0,
        rlshpToFarmer: map['rlshp_to_farmer'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<RespondentRelationship> parseRespondentRelationships(
      Map<String, dynamic> json) {
    final respondentRelationshipsList =
        json['data']['getallRespondentRelationships'] as List<dynamic>;

    return respondentRelationshipsList
        .map((relationshipData) => RespondentRelationship(
              respondendRlshpId: relationshipData['respondendRlshpId'] ?? 0,
              rlshpToFarmer: relationshipData['rlshpToFarmer'] ?? '',
              description: relationshipData['description'] ?? '',
              dateCreated:
                  DateTime.parse(relationshipData['dateCreated'] ?? ''),
              createdBy: relationshipData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
