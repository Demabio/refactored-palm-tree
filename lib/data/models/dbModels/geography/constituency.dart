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
}
