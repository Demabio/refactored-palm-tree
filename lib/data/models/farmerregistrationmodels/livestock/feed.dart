class FarmerLivestockFeed {
  final int farmerLivestockFeedId;
  final int farmerLivestockId;
  final int feedTypeId;
  final double feedQuantity;
  final DateTime dateCreated;
  final int? createdBy;
  final int? enumeratorId;

  FarmerLivestockFeed({
    required this.farmerLivestockFeedId,
    required this.farmerLivestockId,
    required this.feedTypeId,
    required this.feedQuantity,
    required this.dateCreated,
    this.createdBy,
    this.enumeratorId,
  });
  Map<String, dynamic> toJson() {
    return {
      'farmerLivestockFeedId': farmerLivestockFeedId,
      'farmerLivestockId': farmerLivestockId,
      'feedTypeId': feedTypeId,
      'feedQuantity': feedQuantity,
      'dateCreated': dateCreated.toIso8601String(),
      'createdBy': createdBy,
    };
  }

  factory FarmerLivestockFeed.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerLivestockFeed(
        farmerLivestockFeedId: map['farmer_livestockfeed_id']?.toInt() ?? 0,
        farmerLivestockId: map['farmer_livestock_id']?.toInt() ?? 0,
        feedTypeId: map['feed_type_id']?.toInt() ?? 0,
        feedQuantity: map['feed_quantity']?.toDouble() ?? 0.0,
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: int.parse(map['created_by'] ?? "0"),
      );
}
