class Constituency {
  final int constituencyId;
  final int countyId;
  final String constCode;
  final String? constituency;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;

  Constituency({
    required this.constituencyId,
    required this.countyId,
    required this.constCode,
    this.constituency,
    this.area,
    required this.dateCreated,
    this.createdBy,
  });

  factory Constituency.fromSqfliteDatabase(Map<String, dynamic> map) =>
      Constituency(
        constituencyId: map['constituency_id']?.toInt() ?? 0,
        countyId: map['county_id']?.toInt() ?? 0,
        constCode: map['const_code'] ?? '',
        constituency: map['constituency'],
        area: map['area']?.toDouble(),
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
