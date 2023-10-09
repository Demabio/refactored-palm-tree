class LSProgress {
  final int livestockId;
  final int pageOne;
  final int pageTwo;

  LSProgress({
    required this.livestockId,
    required this.pageOne,
    required this.pageTwo,
  });

  factory LSProgress.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LSProgress(
        livestockId: map['livestockId'] ?? 0,
        pageOne: map['pageOne'] ?? 0,
        pageTwo: map['pageTwo'] ?? 0,
      );
}
