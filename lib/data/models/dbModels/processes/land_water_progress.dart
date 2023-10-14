class LWProgress {
  final int farmId;
  final int pageOne;
  final int pageTwo;

  LWProgress({
    required this.farmId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory LWProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LWProgress(
        farmId: map['farmId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
