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

  factory Subcounty.fromSqfliteDatabase(Map<String, dynamic> map) => Subcounty(
        subcountyId: map['subcounty_id']?.toInt() ?? 0,
        countyId: map['county_id']?.toInt() ?? 0,
        subcountyCode: map['subcounty_code'] ?? '',
        subcounty: map['subcounty'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
        dateEdited: map['date_edited'] != null
            ? DateTime.parse(map['date_edited'] ?? '')
            : null,
        editedBy: map['edited_by']?.toInt(),
      );
}
