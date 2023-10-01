class FarmerExtensionAccess {
  final int farmerExtensionAccessId;
  final int farmerId;
  final int farmerFarmId;
  final int extensionSourceId;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerExtensionAccess({
    required this.farmerExtensionAccessId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.extensionSourceId,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerExtensionAccess.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerExtensionAccess(
        farmerExtensionAccessId:
            map['farmer_extension_access_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        extensionSourceId: map['extension_source_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
