class LivestockFarmingSystem {
  final int livestockFarmsystemId;
  final String livestockFarmsystem;
  final String livestockFarmsystemCode;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockFarmingSystem({
    required this.livestockFarmsystemId,
    required this.livestockFarmsystem,
    required this.livestockFarmsystemCode,
    required this.dateCreated,
    this.createdBy,
  });
}
