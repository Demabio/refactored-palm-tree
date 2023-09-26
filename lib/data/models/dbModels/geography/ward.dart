class Ward {
  final int wardId;
  final int subcountyId;
  final int? constituencyId;
  final String wardCode;
  final String ward;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;

  Ward({
    required this.wardId,
    required this.subcountyId,
    this.constituencyId,
    required this.wardCode,
    required this.ward,
    this.area,
    required this.dateCreated,
    this.createdBy,
  });

  factory Ward.fromSqfliteDatabase(Map<String, dynamic> map) => Ward(
        wardId: map['ward_id']?.toInt() ?? 0,
        subcountyId: map['subcounty_id']?.toInt() ?? 0,
        constituencyId: map['constituency_id']?.toInt(),
        wardCode: map['ward_code'] ?? '',
        ward: map['ward'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
