class MaritalStatus {
  final int maritalStatusId;
  final String maritalStatus;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  MaritalStatus({
    required this.maritalStatusId,
    required this.maritalStatus,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory MaritalStatus.fromSqfliteDatabase(Map<String, dynamic> map) =>
      MaritalStatus(
        maritalStatusId: map['marital_status_id']?.toInt() ?? 0,
        maritalStatus: map['marital_status'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
