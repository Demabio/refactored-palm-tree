class FarmersRegistrationStatus {
  final int registrationStatusId;
  final String registrationStatus;
  final String? description;

  FarmersRegistrationStatus({
    required this.registrationStatusId,
    required this.registrationStatus,
    this.description,
  });

  factory FarmersRegistrationStatus.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      FarmersRegistrationStatus(
        registrationStatusId: map['registrationStatusId']?.toInt() ?? 0,
        registrationStatus: map['registrationStatus'] ?? '',
        description: map['description'],
      );

  static List<FarmersRegistrationStatus> parseFarmerRegistrationStatuses(
      Map<String, dynamic> json) {
    final farmerRegistrationStatusesList =
        json['data']['getallFarmerRegistrationStatuses'] as List<dynamic>;

    return farmerRegistrationStatusesList
        .map((statusData) => FarmersRegistrationStatus(
              registrationStatusId: statusData['registrationStatusId'] ?? 0,
              registrationStatus: statusData['registrationStatus'] ?? '',
              description: statusData['description'] ?? '',
            ))
        .toList();
  }
}
