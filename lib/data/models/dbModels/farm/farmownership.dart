class FarmerFarmOwnership {
  final int ownershipId;
  final String ownershipDesc;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerFarmOwnership({
    required this.ownershipId,
    required this.ownershipDesc,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerFarmOwnership.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFarmOwnership(
        ownershipId: map['ownership_id']?.toInt() ?? 0,
        ownershipDesc: map['ownership_desc'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
