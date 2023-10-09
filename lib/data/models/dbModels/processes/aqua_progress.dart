class AQProgress {
  final int fishId;
  final int pageOne;
  final int pageTwo;

  AQProgress({
    required this.fishId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory AQProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      AQProgress(
        fishId: map['fishId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
