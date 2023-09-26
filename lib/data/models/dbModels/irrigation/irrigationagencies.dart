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
}
