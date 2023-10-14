class AQProgress {
  final int farmId;
  final int pageOne;
  final int pageTwo;

  AQProgress({
    required this.farmId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory AQProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AQProgress(
        farmId: map['farmId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
