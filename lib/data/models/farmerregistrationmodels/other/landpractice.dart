class FarmerLandPractice {
  final int farmerPracticeId;
  final int farmerId;
  final int farmerFarmId;
  final int landPracticeId;
  final double? quantity;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerLandPractice({
    required this.farmerPracticeId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.landPracticeId,
    this.quantity,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerLandPractice.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerLandPractice(
        farmerPracticeId: map['farmer_practice_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        landPracticeId: map['land_practice_id']?.toInt() ?? 0,
        quantity: map['quantity']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
