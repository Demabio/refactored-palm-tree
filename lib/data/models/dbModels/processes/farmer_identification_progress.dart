class FIProgress {
  final int farmerId;
  final int pageOne;
  final int pageTwo;
  final int pageThree;
  final int pageFour;

  FIProgress({
    required this.farmerId,
    required this.pageOne,
    required this.pageTwo,
    required this.pageThree,
    required this.pageFour,
  });

  factory FIProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FIProgress(
        farmerId: map['farmerId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
        pageThree: map['pageThree'] ?? 0,
        pageFour: map['pageFour'] ?? 0,
      );
}
