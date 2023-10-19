class FarmerSoilTest {
  final int farmerSoilseedId;
  final int farmerId;
  final int farmerFarmId;
  final int? soilTest;
  final int? soilTestYear;
  final DateTime? dateCreated;
  final int? createdBy;

  FarmerSoilTest({
    required this.farmerSoilseedId,
    required this.farmerId,
    required this.farmerFarmId,
    this.soilTest,
    this.soilTestYear,
    this.dateCreated,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerSoilseedId': farmerSoilseedId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'soilTest': soilTest,
      'soilTestYear': soilTestYear,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerSoilTest.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerSoilTest(
        farmerSoilseedId: map['farmer_soilseed_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        soilTest: int.parse(map['soiltest'] ?? "0"),
        soilTestYear: map['soil_test_year'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
