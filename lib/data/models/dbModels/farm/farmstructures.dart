class FarmStructure {
  final int farmStructureId;
  final String structureName;
  final String? description;
  final DateTime dateCreated;
  final int? createdBy;

  FarmStructure({
    required this.farmStructureId,
    required this.structureName,
    this.description,
    required this.dateCreated,
    this.createdBy,
  });

  factory FarmStructure.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmStructure(
        farmStructureId: map['farm_structure_id']?.toInt() ?? 0,
        structureName: map['structure_name'] ?? '',
        description: map['description'],
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<FarmStructure> parseFarmStructures(Map<String, dynamic> json) {
    final farmStructuresList =
        json['data']['getallFarmStructures'] as List<dynamic>;

    return farmStructuresList
        .map((structureData) => FarmStructure(
              farmStructureId: structureData['farmStructureId'] ?? 0,
              structureName: structureData['structureName'] ?? '',
              description: structureData['description'] ?? '',
              createdBy: structureData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(structureData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
