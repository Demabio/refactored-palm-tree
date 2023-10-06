class County {
  final int countyId;
  final String countyCode;
  final String county;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;

  County({
    required this.countyId,
    required this.countyCode,
    required this.county,
    this.area,
    required this.dateCreated,
    this.createdBy,
  });

  factory County.fromSqfliteDatabase(Map<String, dynamic> map) => County(
        countyId: map['county_id']?.toInt() ?? 0,
        countyCode: map['county_code'] ?? '',
        county: map['county'] ?? '',
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
