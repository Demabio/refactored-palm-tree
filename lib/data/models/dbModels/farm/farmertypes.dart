class FarmerType {
  final int farmerTypeId;
  final String farmerType;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerType({
    required this.farmerTypeId,
    required this.farmerType,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmerType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerType(
        farmerTypeId: map['farmer_type_id']?.toInt() ?? 0,
        farmerType: map['farmer_type'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
