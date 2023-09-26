class PesticideType {
  final int pesticideTypeId;
  final String pesticideType;
  final String? description;

  PesticideType({
    required this.pesticideTypeId,
    required this.pesticideType,
    this.description,
  });

  factory PesticideType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      PesticideType(
        pesticideTypeId: map['pesticide_type_id']?.toInt() ?? 0,
        pesticideType: map['pesticide_type'] ?? '',
        description: map['description'],
      );
}
