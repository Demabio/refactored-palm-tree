class Enterprise {
  final int enterpriseId;
  final String enterpriseDesc;
  final DateTime dateCreated;
  final int? createdBy;

  Enterprise({
    required this.enterpriseId,
    required this.enterpriseDesc,
    required this.dateCreated,
    this.createdBy,
  });

  factory Enterprise.fromSqfliteDatabase(Map<String, dynamic> map) =>
      Enterprise(
        enterpriseId: map['enterprise_id']?.toInt() ?? 0,
        enterpriseDesc: map['enterprise_desc'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
