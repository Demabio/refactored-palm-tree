// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_two_bloc.dart';

/// Represents the state of PrimaryFarmHoldingTwo in the application.
class PrimaryFarmHoldingTwoState extends Equatable {
  PrimaryFarmHoldingTwoState({
    this.titleoneController,
    this.titlethreeController,
    this.titlesevenController,
    this.currentLocation,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
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
  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  PrimaryFarmHoldingTwoModel? primaryFarmHoldingTwoModelObj;

  bool filled;

  bool checked;

  bool growingCropsFor;

  bool trashone;
  LatLng? currentLocation;

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
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        filled,
        checked,
        growingCropsFor,
        trashone,
        trashtwo,
        trashthree,
        treeFarming,
        currentLocation,
        primaryFarmHoldingTwoModelObj,
      ];
  PrimaryFarmHoldingTwoState copyWith({
    TextEditingController? titleoneController,
    TextEditingController? titlethreeController,
    TextEditingController? titlesevenController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    bool? filled,
    bool? checked,
    bool? growingCropsFor,
    bool? trashone,
    bool? trashtwo,
    bool? trashthree,
    LatLng? currentLocation,
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
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }
}
