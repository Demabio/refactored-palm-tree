class FarmerPremium {
  final int insurancePremId;
  final int farmerId;
  final int insuranceId;
  final int? excelPremId;
  final int? authorisedPaymentsId;
  final int seasonId;
  final DateTime datePremiumPaid;
  final double amountPaid;
  final DateTime dateCreated;
  final int? uploadedBy;

  FarmerPremium({
    required this.insurancePremId,
    required this.farmerId,
    required this.insuranceId,
    this.excelPremId,
    this.authorisedPaymentsId,
    required this.seasonId,
    required this.datePremiumPaid,
    required this.amountPaid,
    required this.dateCreated,
    this.uploadedBy,
  });

  factory FarmerPremium.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerPremium(
        insurancePremId: map['insurance_prem_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        insuranceId: map['insurance_id']?.toInt() ?? 0,
        excelPremId: map['excel_prem_id']?.toInt(),
        authorisedPaymentsId: map['authorised_payments_id']?.toInt(),
        seasonId: map['season_id']?.toInt() ?? 0,
        datePremiumPaid: DateTime.parse(map['date_premium_paid'] ?? ''),
        amountPaid: map['amount_paid']?.toDouble() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        uploadedBy: map['uploaded_by']?.toInt(),
      );
}
