class FarmerEnterprise {
  final int farmerEnterpriseId;
  final int farmerFarmId;
  final int enterpriseId;
  final int? insured;
  final String? insuranceName;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerEnterprise({
    required this.farmerEnterpriseId,
    required this.farmerFarmId,
    required this.enterpriseId,
    this.insured,
    this.insuranceName,
    required this.dateCreated,
    this.createdBy,
  });

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
