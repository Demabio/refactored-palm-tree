class FarmerFishInput {
  int farmerFishInputId;
  int farmerId;
  int farmerFarmId;
  int fishInputId;
  DateTime? dateCreated;
  int? createdBy;

  FarmerFishInput({
    required this.farmerFishInputId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.fishInputId,
    this.dateCreated,
    this.createdBy,
  });

  factory FarmerFishInput.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFishInput(
        farmerFishInputId: map['farmer_fish_input_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        fishInputId: map['fish_input_id']?.toInt() ?? 0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt() ?? 0,
      );
}
