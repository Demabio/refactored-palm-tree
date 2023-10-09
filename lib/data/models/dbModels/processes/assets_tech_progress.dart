class ATProgress {
  final int farmerId;
  final int pageOne;
  final int pageTwo;

  ATProgress({
    required this.farmerId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory ATProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      ATProgress(
        farmerId: map['farmerId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
