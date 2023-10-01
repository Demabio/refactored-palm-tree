class FarmerProgram {
  final int farmProgId;
  final int programId;
  final int farmerId;

  FarmerProgram({
    required this.farmProgId,
    required this.programId,
    required this.farmerId,
  });

  factory FarmerProgram.fromSqfliteDatabase(Map<String, dynamic> map) =>
      FarmerProgram(
        farmProgId: map['farm_prog_id']?.toInt() ?? 0,
        programId: map['program_id']?.toInt() ?? 0,
        farmerId: map['farmer_id']?.toInt() ?? 0,
      );
}
