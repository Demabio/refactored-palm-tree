class FarmerEnterprise {
  int farmerEnterpriseId;
  int farmerFarmId;
  int enterpriseId;
  int? insured;
  String? insuranceName;
  DateTime? dateCreated;
  int? createdBy;

  FarmerEnterprise({
    required this.farmerEnterpriseId,
    required this.farmerFarmId,
    required this.enterpriseId,
    this.insured,
    this.insuranceName,
    this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerEnterpriseId': farmerEnterpriseId,
      'farmerFarmId': farmerFarmId,
      'enterpriseId': enterpriseId,
      'insured': insured,
      'insuranceName': insuranceName,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerEnterprise.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerEnterprise(
        farmerEnterpriseId: map['farmer_enterprise_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        enterpriseId: map['enterprise_id']?.toInt() ?? 0,
        insured: map['insured']?.toInt(),
        insuranceName: map['insurance_name'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
