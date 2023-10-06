class FarmerSoilTest {
  final int farmerSoilseedId;
  final int farmerId;
  final int farmerFarmId;
  final int? soilTest;
  final String? soilTestYear;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerSoilTest({
    required this.farmerSoilseedId,
    required this.farmerId,
    required this.farmerFarmId,
    this.soilTest,
    this.soilTestYear,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerSoilTest.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerSoilTest(
        farmerSoilseedId: map['farmer_soilseed_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        soilTest: map['soiltest']?.toInt(),
        soilTestYear: map['soil_test_year'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
