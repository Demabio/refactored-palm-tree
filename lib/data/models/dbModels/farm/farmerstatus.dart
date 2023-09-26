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

  factory FarmerStatus.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerStatus(
        farmerStatusId: map['farmer_status_id']?.toInt() ?? 0,
        farmerStatus: map['farmer_status'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
