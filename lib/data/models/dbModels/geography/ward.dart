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
}
