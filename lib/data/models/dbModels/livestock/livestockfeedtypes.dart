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
}
