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

  factory Division.fromSqfliteDatabase(Map<String, dynamic> map) => Division(
        divisionId: map['division_id']?.toInt() ?? 0,
        countyId: map['county_id']?.toInt() ?? 0,
        divisionCode: map['division_code'] ?? '',
        division: map['division'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
        dateEdited: map['date_edited'] != null
            ? DateTime.parse(map['date_edited'] ?? '')
            : null,
        editedBy: map['edited_by']?.toInt(),
      );
}
