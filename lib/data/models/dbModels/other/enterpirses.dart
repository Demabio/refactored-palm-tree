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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<Enterprise> parseEnterprises(Map<String, dynamic> json) {
    final enterprisesList = json['data']['getallEnterprises'] as List<dynamic>;

    return enterprisesList
        .map((enterpriseData) => Enterprise(
              enterpriseId: enterpriseData['enterpriseId'] ?? 0,
              enterpriseDesc: enterpriseData['enterpriseDesc'] ?? '',
              createdBy: enterpriseData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(enterpriseData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
