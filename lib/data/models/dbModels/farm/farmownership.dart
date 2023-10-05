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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<FarmerFarmOwnership> parseFarmerFarmOwnerships(
      Map<String, dynamic> json) {
    final farmerFarmOwnershipsList =
        json['data']['getallFarmerFarmOwnerships'] as List<dynamic>;

    return farmerFarmOwnershipsList
        .map((ownershipData) => FarmerFarmOwnership(
              ownershipId: ownershipData['ownershipId'] ?? 0,
              ownershipDesc: ownershipData['ownershipDesc'] ?? '',
              createdBy: ownershipData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(ownershipData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
