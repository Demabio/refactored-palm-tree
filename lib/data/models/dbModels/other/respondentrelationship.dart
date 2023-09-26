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
        createdBy: map['created_by']?.toInt(),
      );
}
