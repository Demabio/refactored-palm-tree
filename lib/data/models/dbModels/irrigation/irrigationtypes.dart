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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );

  static List<IrrigationType> parseIrrigationTypes(Map<String, dynamic> json) {
    final irrigationTypesList =
        json['data']['getallIrrigationTypes'] as List<dynamic>;

    return irrigationTypesList
        .map((typeData) => IrrigationType(
              irrigationTypeId: typeData['irrigationTypeId'] ?? 0,
              irrigationType: typeData['irrigationType'] ?? '',
              createdBy: typeData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(typeData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
