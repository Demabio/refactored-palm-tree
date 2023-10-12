// ignore_for_file: must_be_immutable

part of 'aquaculture_bloc.dart';

/// Represents the state of Aquaculture in the application.
class AquacultureState extends Equatable {
  AquacultureState({
    this.aquacultureModelObj,
    this.inputs = const [],
    this.aquatypes = const [],
    this.prodsyss = const [],
    this.fish = const [],
    this.farmerFishProductionLevel,
    this.level,
  });

  AquacultureModel? aquacultureModelObj;
  List<CheckBoxList> inputs;
  List<CheckBoxList> aquatypes;
  List<CheckBoxList> prodsyss;
  List<CheckBoxList> fish;
  FarmerFishProductionLevel? farmerFishProductionLevel;
  String? level;
  @override
  List<Object?> get props => [
        aquacultureModelObj,
        inputs,
        aquatypes,
        prodsyss,
        fish,
        level,
        farmerFishProductionLevel,
      ];
  AquacultureState copyWith({
    AquacultureModel? aquacultureModelObj,
    List<CheckBoxList>? inputs,
    List<CheckBoxList>? aquatypes,
    List<CheckBoxList>? prodsyss,
    List<CheckBoxList>? fish,
    FarmerFishProductionLevel? farmerFishProductionLevel,
    String? level,
  }) {
    return AquacultureState(
      aquacultureModelObj: aquacultureModelObj ?? this.aquacultureModelObj,
      inputs: inputs ?? this.inputs,
      aquatypes: aquatypes ?? this.aquatypes,
      prodsyss: prodsyss ?? this.prodsyss,
      fish: fish ?? this.fish,
      level: level ?? this.level,
      farmerFishProductionLevel:
          farmerFishProductionLevel ?? this.farmerFishProductionLevel,
    );
  }
}
