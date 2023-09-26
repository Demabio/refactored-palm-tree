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
}
