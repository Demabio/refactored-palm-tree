class IrrigationMembershipType {
  int membershipTypeId;
  String irrigationMembershipType;
  DateTime? dateCreated;

  IrrigationMembershipType({
    required this.membershipTypeId,
    required this.irrigationMembershipType,
    this.dateCreated,
  });

  factory IrrigationMembershipType.fromSqfliteDatabase(
          Map<String, dynamic> map) =>
      IrrigationMembershipType(
        membershipTypeId: map['membership_type_id']?.toInt() ?? 0,
        irrigationMembershipType: map['irrigation_membership_type'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
      );
  static List<IrrigationMembershipType> parseIrrigationMembershipTypes(
      Map<String, dynamic> json) {
    final irrigationMembershipTypesList =
        json['data']['getallIrrigationMembership'] as List<dynamic>;

    return irrigationMembershipTypesList
        .map((irrigationMembershipTypeData) => IrrigationMembershipType(
              membershipTypeId:
                  irrigationMembershipTypeData['membershipTypeId'] ?? 0,
              irrigationMembershipType:
                  irrigationMembershipTypeData['irrigationMembershipType'] ??
                      '',
              dateCreated: DateTime.parse(
                  irrigationMembershipTypeData['dateCreated'] ?? ''),
            ))
        .toList();
  }
}
