class FarmerFertiliser {
  final int farmerFertId;
  final int farmerId;
  final int farmerFarmId;
  final int farmerCropId;
  final int fertiliserTypeId;
  final String? compoundName;
  final String? basalOthersName;
  final String? others;
  final DateTime? dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerFertiliser({
    required this.farmerFertId,
    required this.farmerId,
    required this.farmerFarmId,
    required this.farmerCropId,
    required this.fertiliserTypeId,
    this.compoundName,
    this.basalOthersName,
    this.others,
    this.dateCreated,
    this.enumeratorId,
    this.createdBy,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerFertId': farmerFertId,
      'farmerId': farmerId,
      'farmerFarmId': farmerFarmId,
      'farmerCropId': farmerCropId,
      'fertiliserTypeId': fertiliserTypeId,
      'compoundName': compoundName,
      'basalOthersName': basalOthersName,
      'others': others,
      'dateCreated': dateCreated?.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerFertiliser.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerFertiliser(
        farmerFertId: map['farmer_fert_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        farmerFarmId: map['farmer_farm_id']?.toInt() ?? 0,
        farmerCropId: map['farmer_crop_id']?.toInt() ?? 0,
        fertiliserTypeId: map['fertiliser_type_id']?.toInt() ?? 0,
        compoundName: map['compound_name'],
        basalOthersName: map['basal_others_name'],
        others: map['others'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by'] ?? 0,
      );
}
