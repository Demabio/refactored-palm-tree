class FarmerExtensionMode {
  final int farmerExtensionModeId;
  final int farmerId;
  final int farmerFarmId;
  final int extensionModeId;
  final String? other;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerExtensionMode({
    required this.farmerExtensionModeId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.extensionModeId,
    this.other,
    this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerExtensionModeId': farmerExtensionModeId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'extensionModeId': extensionModeId,
      'other': other,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerExtensionMode.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerExtensionMode(
        farmerExtensionModeId: map['farmer_extension_mode_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        extensionModeId: map['extension_mode_id']?.toInt() ?? 0,
        other: map['other'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
