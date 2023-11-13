class FarmerLabourSource {
  int farmLabourSourceId;
  int farmerId;
  int farmerFarmId;
  int labourSourceId;
  DateTime? dateCreated;
  int? createdBy;
  final int? enumeratorId;

  FarmerLabourSource({
    required this.farmLabourSourceId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.labourSourceId,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmLabourSourceId': farmLabourSourceId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'labourSourceId': labourSourceId,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerLabourSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerLabourSource(
        farmLabourSourceId: map['farm_labour_source_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        labourSourceId: map['labour_source_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
