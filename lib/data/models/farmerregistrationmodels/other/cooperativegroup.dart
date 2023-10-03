class FarmerCooperativeGroup {
  final int farmerCooperativeGroupId;
  final int farmerId;
  final int farmerFarmId;
  final int cooperateiveGroupId;
  final String? cooperateiveGroupName;
  final String? other;
  final int? createdBy;
  final DateTime dateCreated;

  FarmerCooperativeGroup({
    required this.farmerCooperativeGroupId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.cooperateiveGroupId,
    this.cooperateiveGroupName,
    this.other,
    this.createdBy,
    required this.dateCreated,
  });

  factory FarmerCooperativeGroup.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmerCooperativeGroup(
        farmerCooperativeGroupId:
            map['farmer_cooperative_group_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        cooperateiveGroupId: map['cooperateive_group_id']?.toInt() ?? 0,
        cooperateiveGroupName: map['cooperateive_group_name'],
        other: map['other'],
        createdBy: map['created_by']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
      );
}