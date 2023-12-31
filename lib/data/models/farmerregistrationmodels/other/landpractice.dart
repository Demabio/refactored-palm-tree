class FarmerLandPractice {
  final int farmerPracticeId;
  final int farmerId;
  final int farmerFarmId;
  final int landPracticeId;
  final double? quantity;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerLandPractice({
    required this.farmerPracticeId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.landPracticeId,
    this.quantity,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerPracticeId': farmerPracticeId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'landPracticeId': landPracticeId,
      'quantity': quantity,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerLandPractice.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerLandPractice(
        farmerPracticeId: map['farmer_practice_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        landPracticeId: map['land_practice_id']?.toInt() ?? 0,
        quantity: map['quantity']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
