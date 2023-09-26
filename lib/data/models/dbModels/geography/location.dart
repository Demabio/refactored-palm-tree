class Location {
  final int locationId;
  final int subcountyId;
  final int divisionId;
  final String locationCode;
  final String location;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;
  final DateTime? dateEdited;
  final int? editedBy;

  Location({
    required this.locationId,
    required this.subcountyId,
    required this.divisionId,
    required this.locationCode,
    required this.location,
    this.area,
    required this.dateCreated,
    this.createdBy,
    this.dateEdited,
    this.editedBy,
  });
}
