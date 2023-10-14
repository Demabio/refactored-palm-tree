class FSProgress {
  final int farmId;
  final int pageOne;
  final int pageTwo;

  FSProgress({
    required this.farmId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory FSProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FSProgress(
        farmId: map['farmId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
