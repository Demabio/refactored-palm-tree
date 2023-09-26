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

  factory LivestockFarmingSystem.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      LivestockFarmingSystem(
        livestockFarmsystemId: map['livestock_farmsystem_id']?.toInt() ?? 0,
        livestockFarmsystem: map['livestock_farmsystem'] ?? '',
        livestockFarmsystemCode: map['livestock_farmsystem_code'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
