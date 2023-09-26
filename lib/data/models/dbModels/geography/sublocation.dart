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

  factory Sublocation.fromSqfliteDatabase(Map<String, dynamic> map) =>
      Sublocation(
        sublocationId: map['sublocation_id']?.toInt() ?? 0,
        locationId: map['location_id']?.toInt() ?? 0,
        sublocationCode: map['sublocation_code'] ?? '',
        sublocation: map['sublocation'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
        dateEdited: map['date_edited'] != null
            ? DateTime.parse(map['date_edited'] ?? '')
            : null,
        editedBy: map['edited_by']?.toInt(),
      );
}
