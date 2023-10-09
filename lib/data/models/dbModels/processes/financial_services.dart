class FSProgress {
  final int farmerId;
  final int pageOne;
  final int pageTwo;

  FSProgress({
    required this.farmerId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory FSProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FSProgress(
        farmerId: map['farmerId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
