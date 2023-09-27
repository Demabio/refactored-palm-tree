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
  static List<FarmerStatus> parseFarmerStatus(Map<String, dynamic> json) {
    final farmerStatusList =
        json['data']['getallFarmerStatus'] as List<dynamic>;

    return farmerStatusList
        .map((statusData) => FarmerStatus(
              farmerStatusId: statusData['farmerStatusId'] ?? 0,
              farmerStatus: statusData['farmerStatus'] ?? '',
              description: statusData['description'] ?? '',
              createdBy: statusData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(statusData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
