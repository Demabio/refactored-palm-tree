class FarmerCreditService {
  final int farmerCreditServiceId;
  final int farmerId;
  final int? creditSourceId;
  final String saccoName;
  final String? mfInstitutionName;
  final String? othersName;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerCreditService({
    required this.farmerCreditServiceId,
    required this.farmerId,
    this.creditSourceId,
    required this.saccoName,
    this.mfInstitutionName,
    this.othersName,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerCreditService.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerCreditService(
        farmerCreditServiceId: map['farmer_creditservice_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        creditSourceId: map['credit_source_id']?.toInt(),
        saccoName: map['sacco_name'] ?? '',
        mfInstitutionName: map['mfintitution_name'],
        othersName: map['others_name'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}