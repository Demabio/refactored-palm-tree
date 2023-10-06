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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<LivestockFarmingSystem> parseLivestockFarmingSystems(
      Map<String, dynamic> json) {
    final livestockFarmingSystemsList =
        json['data']['getAllLivestockFarmingSystems'] as List<dynamic>;

    return livestockFarmingSystemsList
        .map((systemData) => LivestockFarmingSystem(
              livestockFarmsystemId: systemData['livestockFarmsystemId'] ?? 0,
              livestockFarmsystem: systemData['livestockFarmsystem'] ?? '',
              livestockFarmsystemCode:
                  systemData['livestockFarmsystemCode'] ?? '',
              createdBy: systemData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(systemData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
