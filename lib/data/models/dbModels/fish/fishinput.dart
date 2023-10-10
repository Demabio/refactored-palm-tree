class FishInput {
  int fishInputId;
  String fishInput;
  String description;
  DateTime? dateCreated;
  int? createdBy;

  FishInput({
    required this.fishInputId,
    required this.fishInput,
    required this.description,
    this.dateCreated,
    this.createdBy,
  });

  factory FishInput.fromSqfliteDatabase(Map<String, dynamic> map) => FishInput(
        fishInputId: map['fish_input_id']?.toInt() ?? 0,
        fishInput: map['fish_input'] ?? '',
        description: map['description'] ?? '',
        dateCreated: DateTime.parse(map['date_created'] ?? ''),
        createdBy: map['created_by']?.toInt() ?? 0,
      );
  static List<FishInput> parseFishInputs(Map<String, dynamic> json) {
    final fishInputsList = json['data']['getallFishInput'] as List<dynamic>;

    return fishInputsList
        .map((fishInputData) => FishInput(
              fishInputId: fishInputData['fishInputId'] ?? 0,
              fishInput: fishInputData['fishInput'] ?? '',
              description: fishInputData['description'] ?? '',
              dateCreated: DateTime.parse(fishInputData['dateCreated'] ?? ''),
              createdBy: fishInputData['createdBy'] ?? 0,
            ))
        .toList();
  }
}
