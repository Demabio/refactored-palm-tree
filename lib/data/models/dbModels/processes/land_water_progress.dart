class LWProgress {
  final int farmerId;
  final int pageOne;
  final int pageTwo;

  LWProgress({
    required this.farmerId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory LWProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LWProgress(
        farmerId: map['farmerId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
