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

  factory IrrigationType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      IrrigationType(
        irrigationTypeId: map['irrigation_type_id']?.toInt() ?? 0,
        irrigationType: map['irrigation_type'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
