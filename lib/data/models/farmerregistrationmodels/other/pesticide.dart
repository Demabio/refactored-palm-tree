class FarmerPesticide {
  final int farmerPesticideId;
  final int farmerId;
  final int farmerFarmId;
  final int farmerCropId;
  final int pesticideTypeId;
  final String? others;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerPesticide({
    required this.farmerPesticideId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.farmerCropId,
    required this.pesticideTypeId,
    this.others,
    this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerPesticideId': farmerPesticideId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'farmerCropId': farmerCropId,
      'pesticideTypeId': pesticideTypeId,
      'others': others,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerPesticide.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerPesticide(
        farmerPesticideId: map['farmer_pesticide_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmerCropId: map['farmer_crop_id']?.toInt() ?? 0,
        pesticideTypeId: map['pesticide_type_id']?.toInt() ?? 0,
        others: map['others'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
