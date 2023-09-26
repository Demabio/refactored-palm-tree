class FarmerStatus {
  final int farmerStatusId;
  final String farmerStatus;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FarmerStatus({
    required this.farmerStatusId,
    required this.farmerStatus,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });
}
