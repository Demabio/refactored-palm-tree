class FarmerIncomeSource {
  final int farmerIncomeId;
  final int? incomeSourceId;
  final int priorityLevel;
  final int farmerId;
  final String? other;

  FarmerIncomeSource({
    required this.farmerIncomeId,
    this.incomeSourceId,
    required this.priorityLevel,
    required this.farmerId,
    this.other,
  });

  factory FarmerIncomeSource.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerIncomeSource(
        farmerIncomeId: map['farmer_income_id']?.toInt() ?? 0,
        incomeSourceId: map['income_source_id']?.toInt(),
        priorityLevel: map['priority_level']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        other: map['other'],
      );
}
