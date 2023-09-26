class IrrigationType {
  final int irrigationTypeId;
  final String irrigationType;
  final DateTime dateCreated;
  final int? createdBy;

  IrrigationType({
    required this.irrigationTypeId,
    required this.irrigationType,
    required this.dateCreated,
    this.createdBy,
  });
}
