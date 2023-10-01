class FarmerCampChange {
  final int id;
  final int farmerId;
  final int oldAgriCampId;
  final int seasonId;
  final int newAgriCampId;
  final int? approvedBy;
  final DateTime? dateApproved;

  FarmerCampChange({
    required this.id,
    required this.farmerId,
    required this.oldAgriCampId,
    required this.seasonId,
    required this.newAgriCampId,
    this.approvedBy,
    this.dateApproved,
  });

  factory FarmerCampChange.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerCampChange(
        id: map['id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
        oldAgriCampId: map['old_agri_camp_id']?.toInt() ?? 0,
        seasonId: map['season_id']?.toInt() ?? 0,
        newAgriCampId: map['new_agri_camp_id']?.toInt() ?? 0,
        approvedBy: map['approved_by']?.toInt(),
        dateApproved: map['date_approved'] != null
            ? DateTime.parse(map['date_approved'])
            : null,
      );
}
