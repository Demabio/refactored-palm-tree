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
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
  static List<LivestockFeedType> parseLivestockFeedTypes(
      Map<String, dynamic> json) {
    final livestockFeedTypesList =
        json['data']['getAllLivestockFeedTypes'] as List<dynamic>;

    return livestockFeedTypesList
        .map((feedTypeData) => LivestockFeedType(
              feedTypeId: feedTypeData['feedTypeId'] ?? 0,
              feedType: feedTypeData['feedType'] ?? '',
              createdBy: feedTypeData['createdBy'] ?? 0,
              dateCreated: DateTime.parse(feedTypeData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
