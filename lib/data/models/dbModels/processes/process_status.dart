class ProcessStatus {
  final int farmerId;
  final int farmeridentification;
  final int primaryfarmholding;
  final int cropAgriculture;
  final int livestock;
  final int aquaculture;
  final int farmAssets;
  final int landWater;
  final int financialServices;

  ProcessStatus({
    required this.farmerId,
    required this.farmeridentification,
    required this.primaryfarmholding,
    required this.cropAgriculture,
    required this.livestock,
    required this.aquaculture,
    required this.farmAssets,
    required this.landWater,
    required this.financialServices,
  });

  factory ProcessStatus.fromSqfliteDatabase(Map<String, dynamic> map) =>
      ProcessStatus(
        farmerId: map['farmerId'] ?? 0,
        farmeridentification: map['farmeridentification'] ?? 0,
        primaryfarmholding: map['primaryfarmholding'] ?? 0,
        cropAgriculture: map['cropAgriculture'] ?? 0,
        livestock: map['livestock'] ?? 0,
        aquaculture: map['aquaculture'] ?? 0,
        farmAssets: map['farmAssets'] ?? 0,
        landWater: map['landWater'] ?? 0,
        financialServices: map['financialServices'] ?? 0,
      );
}
