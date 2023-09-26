class LivestockFeedType {
  final int feedTypeId;
  final String feedType;
  final DateTime dateCreated;
  final int? createdBy;

  LivestockFeedType({
    required this.feedTypeId,
    required this.feedType,
    required this.dateCreated,
    this.createdBy,
  });

  factory LivestockFeedType.fromSqfliteDatabase(Map<String, dynamic> map) =>
      LivestockFeedType(
        feedTypeId: map['feed_type_id']?.toInt() ?? 0,
        feedType: map['feed_type'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt(),
      );
}
