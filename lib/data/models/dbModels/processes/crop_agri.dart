class CAProgress {
  final int cropId;
  final int pageOne;
  final int pageTwo;

  CAProgress({
    required this.cropId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory CAProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      CAProgress(
        cropId: map['cropId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
