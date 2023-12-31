class FarmerStructure {
  final int farmerAssetId;
  final int farmerId;
  final int farmerFarmId;
  final int farmStructureId;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerStructure({
    required this.farmerAssetId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.farmStructureId,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerAssetId': farmerAssetId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'farmStructureId': farmStructureId,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerStructure.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerStructure(
        farmerAssetId: map['farmer_asset_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmStructureId: map['farm_structure_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
