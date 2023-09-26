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
}
