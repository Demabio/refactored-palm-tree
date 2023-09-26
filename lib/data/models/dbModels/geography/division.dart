class Division {
  final int divisionId;
  final int countyId;
  final String divisionCode;
  final String division;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;
  final DateTime? dateEdited;
  final int? editedBy;

  Division({
    required this.divisionId,
    required this.countyId,
    required this.divisionCode,
    required this.division,
    this.area,
    required this.dateCreated,
    this.createdBy,
    this.dateEdited,
    this.editedBy,
  });
}
