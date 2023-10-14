class PFProgress {
  final int farmId;
  final int pageOne;
  final int pageTwo;

  PFProgress({
    required this.farmId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory PFProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      PFProgress(
        farmId: map['farmId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
