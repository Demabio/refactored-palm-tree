class Livestock {
  final int livestockId;
  final String livestock;
  final int livestockSubCatId;
  final String livestockCode;
  final String commonLivestock;
  final DateTime dateCreated;
  final int? createdBy;

  Livestock({
    required this.livestockId,
    required this.livestock,
    required this.livestockSubCatId,
    required this.livestockCode,
    required this.commonLivestock,
    required this.dateCreated,
    this.createdBy,
  });
}
