class FarmerCooperativeGroup {
  final int farmerCooperativeGroupId;
  final int farmerId;
  final int farmerFarmId;
  final int cooperateiveGroupId;
  final String? cooperateiveGroupName;
  final String? other;
  final int? createdBy;
  final DateTime? dateCreated;

  FarmerCooperativeGroup({
    required this.farmerCooperativeGroupId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.cooperateiveGroupId,
    this.cooperateiveGroupName,
    this.other,
    this.createdBy,
    this.dateCreated,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerCooperativeGroupId': farmerCooperativeGroupId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'cooperateiveGroupId': cooperateiveGroupId,
      'cooperateiveGroupName': cooperateiveGroupName,
      'other': other,
      'createdBy': createdBy,
      'dateCreated': dateCreated?.toIso8601String(),
    };
  }

  factory FarmerCooperativeGroup.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerCooperativeGroup(
        farmerCooperativeGroupId:
            map['farmer_cooperative_group_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        cooperateiveGroupId: map['cooperative_group_id']?.toInt() ?? 0,
        cooperateiveGroupName: map['cooperative_group_name'],
        other: map['other'],
        createdBy: map['created_by'] ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
      );
}
