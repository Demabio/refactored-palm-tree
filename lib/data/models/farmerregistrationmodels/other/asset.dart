class FarmerAsset {
  final int farmerAssetId;
  final int farmerId;
  final int farmerFarmId;
  final int farmAssetId;
  final int qty;
  final int? usableCondition;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerAsset({
    required this.farmerAssetId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.farmAssetId,
    required this.qty,
    this.usableCondition,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerAsset.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerAsset(
        farmerAssetId: map['farmer_asset_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmAssetId: map['farm_asset_id']?.toInt() ?? 0,
        qty: map['qty']?.toInt() ?? 0,
        usableCondition: map['usable_condition']?.toInt(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
