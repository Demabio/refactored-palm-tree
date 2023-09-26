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

  factory Location.fromSqfliteDatabase(Map<String, dynamic> map) => Location(
        locationId: map['location_id']?.toInt() ?? 0,
        subcountyId: map['subcounty_id']?.toInt() ?? 0,
        divisionId: map['division_id']?.toInt() ?? 0,
        locationCode: map['location_code'] ?? '',
        location: map['location'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
        dateEdited: map['date_edited'] != null
            ? DateTime.parse(map['date_edited'] ?? '')
            : null,
        editedBy: map['edited_by']?.toInt(),
      );
}
