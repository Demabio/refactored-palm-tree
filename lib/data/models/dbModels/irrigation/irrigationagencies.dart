class IrrigationAgency {
  final int irrigationAgencyId;
  final String agencyName;
  final DateTime dateCreated;
  final int? createdBy;

  IrrigationAgency({
    required this.irrigationAgencyId,
    required this.agencyName,
    required this.dateCreated,
    this.createdBy,
  });

  factory IrrigationAgency.fromSqfliteDatabase(Map<String, dynamic> map) =>
      IrrigationAgency(
        irrigationAgencyId: map['irrigation_agency_id']?.toInt() ?? 0,
        agencyName: map['agency_name'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
  static List<IrrigationAgency> parseIrrigationAgencies(
      Map<String, dynamic> json) {
    final irrigationAgenciesList =
        json['data']['getallIrrigationAgencies'] as List<dynamic>;

    return irrigationAgenciesList
        .map((agencyData) => IrrigationAgency(
              irrigationAgencyId: agencyData['irrigationAgencyId'] ?? 0,
              agencyName: agencyData['agencyName'] ?? '',
              createdBy: agencyData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(agencyData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
