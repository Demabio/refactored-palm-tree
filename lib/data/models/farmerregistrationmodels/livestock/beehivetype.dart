class FarmerLivestockBeehiveType {
  final int beehivesFarmerId;
  final int farmerLivestockId;
  final int beehivesTypeId;
  final DateTime dateCreated;
  final int createdBy;

  FarmerLivestockBeehiveType({
    required this.beehivesFarmerId,
    required this.farmerLivestockId,
    required this.beehivesTypeId,
    required this.dateCreated,
    required this.createdBy,
  });
Map<String, dynamic> toJson() {
  return {
    'beehivesFarmerId': beehivesFarmerId,
    'farmerLivestockId': farmerLivestockId,
    'beehivesTypeId': beehivesTypeId,
    'dateCreated': dateCreated.toIso8601String(),
    'createdBy': createdBy,
  };
}

  factory FarmerLivestockBeehiveType.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerLivestockBeehiveType(
        beehivesFarmerId: map['beehives_farmer_id']?.toInt() ?? 0,
        farmerLivestockId: map['farmer_livestock_id']?.toInt() ?? 0,
        beehivesTypeId: map['beehives_type_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt() ?? 0,
      );
}
