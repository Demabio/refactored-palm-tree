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
}
