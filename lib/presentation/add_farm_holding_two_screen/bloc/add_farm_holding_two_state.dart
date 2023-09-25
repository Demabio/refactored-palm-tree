// ignore_for_file: must_be_immutable

part of 'add_farm_holding_two_bloc.dart';

/// Represents the state of AddFarmHoldingTwo in the application.
class AddFarmHoldingTwoState extends Equatable {
  AddFarmHoldingTwoState({
    this.titlethreeController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.aquacultureForS = false,
    this.trash = false,
    this.growingCropsFor = false,
    this.trashone = false,
    this.trashtwo = false,
    this.trashthree = false,
    this.treeFarming = false,
    this.addFarmHoldingTwoModelObj,
  });

  TextEditingController? titlethreeController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddFarmHoldingTwoModel? addFarmHoldingTwoModelObj;

  bool aquacultureForS;

  bool trash;

  bool growingCropsFor;

  bool trashone;

  bool trashtwo;

  bool trashthree;

  bool treeFarming;

  @override
  List<Object?> get props => [
        titlethreeController,
        selectedDropDownValue,
        selectedDropDownValue1,
        aquacultureForS,
        trash,
        growingCropsFor,
        trashone,
        trashtwo,
        trashthree,
        treeFarming,
        addFarmHoldingTwoModelObj,
      ];
  AddFarmHoldingTwoState copyWith({
    TextEditingController? titlethreeController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    bool? aquacultureForS,
    bool? trash,
    bool? growingCropsFor,
    bool? trashone,
    bool? trashtwo,
    bool? trashthree,
    bool? treeFarming,
    AddFarmHoldingTwoModel? addFarmHoldingTwoModelObj,
  }) {
    return AddFarmHoldingTwoState(
      titlethreeController: titlethreeController ?? this.titlethreeController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      aquacultureForS: aquacultureForS ?? this.aquacultureForS,
      trash: trash ?? this.trash,
      growingCropsFor: growingCropsFor ?? this.growingCropsFor,
      trashone: trashone ?? this.trashone,
      trashtwo: trashtwo ?? this.trashtwo,
      trashthree: trashthree ?? this.trashthree,
      treeFarming: treeFarming ?? this.treeFarming,
      addFarmHoldingTwoModelObj:
          addFarmHoldingTwoModelObj ?? this.addFarmHoldingTwoModelObj,
    );
  }
}
