// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_two_bloc.dart';

/// Represents the state of PrimaryFarmHoldingTwo in the application.
class PrimaryFarmHoldingTwoState extends Equatable {
  PrimaryFarmHoldingTwoState({
    this.titleoneController,
    this.titlethreeController,
    this.titlesevenController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.filled = false,
    this.checked = false,
    this.growingCropsFor = false,
    this.trashone = false,
    this.trashtwo = false,
    this.trashthree = false,
    this.treeFarming = false,
    this.primaryFarmHoldingTwoModelObj,
  });

  TextEditingController? titleoneController;

  TextEditingController? titlethreeController;

  TextEditingController? titlesevenController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  PrimaryFarmHoldingTwoModel? primaryFarmHoldingTwoModelObj;

  bool filled;

  bool checked;

  bool growingCropsFor;

  bool trashone;

  bool trashtwo;

  bool trashthree;

  bool treeFarming;

  @override
  List<Object?> get props => [
        titleoneController,
        titlethreeController,
        titlesevenController,
        selectedDropDownValue,
        selectedDropDownValue1,
        filled,
        checked,
        growingCropsFor,
        trashone,
        trashtwo,
        trashthree,
        treeFarming,
        primaryFarmHoldingTwoModelObj,
      ];
  PrimaryFarmHoldingTwoState copyWith({
    TextEditingController? titleoneController,
    TextEditingController? titlethreeController,
    TextEditingController? titlesevenController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    bool? filled,
    bool? checked,
    bool? growingCropsFor,
    bool? trashone,
    bool? trashtwo,
    bool? trashthree,
    bool? treeFarming,
    PrimaryFarmHoldingTwoModel? primaryFarmHoldingTwoModelObj,
  }) {
    return PrimaryFarmHoldingTwoState(
      titleoneController: titleoneController ?? this.titleoneController,
      titlethreeController: titlethreeController ?? this.titlethreeController,
      titlesevenController: titlesevenController ?? this.titlesevenController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      filled: filled ?? this.filled,
      checked: checked ?? this.checked,
      growingCropsFor: growingCropsFor ?? this.growingCropsFor,
      trashone: trashone ?? this.trashone,
      trashtwo: trashtwo ?? this.trashtwo,
      trashthree: trashthree ?? this.trashthree,
      treeFarming: treeFarming ?? this.treeFarming,
      primaryFarmHoldingTwoModelObj:
          primaryFarmHoldingTwoModelObj ?? this.primaryFarmHoldingTwoModelObj,
    );
  }
}
