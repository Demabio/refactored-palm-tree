class ATProgress {
  final int farmId;
  final int pageOne;
  final int pageTwo;

  ATProgress({
    required this.farmId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory ATProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      ATProgress(
        farmId: map['farmId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
