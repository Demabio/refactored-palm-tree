class County {
  final int countyId;
  final String? countyCode;
  final String? county;
  final double? area;
  final DateTime dateCreated;
  final int? createdBy;

  County({
    required this.countyId,
    this.countyCode,
    this.county,
    this.area,
    required this.dateCreated,
    this.createdBy,
  });
}
