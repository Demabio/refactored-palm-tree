class Sublocation {
  final int sublocationId;
  final int locationId;
  final String sublocationCode;
  final String sublocation;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;
  final DateTime? dateEdited;
  final int? editedBy;

  Sublocation({
    required this.sublocationId,
    required this.locationId,
    required this.sublocationCode,
    required this.sublocation,
    this.area,
    required this.dateCreated,
    this.createdBy,
    this.dateEdited,
    this.editedBy,
  });
}
