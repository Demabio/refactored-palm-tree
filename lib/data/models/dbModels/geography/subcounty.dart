class Subcounty {
  final int subcountyId;
  final int countyId;
  final String subcountyCode;
  final String subcounty;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;
  final DateTime? dateEdited;
  final int? editedBy;

  Subcounty({
    required this.subcountyId,
    required this.countyId,
    required this.subcountyCode,
    required this.subcounty,
    this.area,
    required this.dateCreated,
    this.createdBy,
    this.dateEdited,
    this.editedBy,
  });
}
