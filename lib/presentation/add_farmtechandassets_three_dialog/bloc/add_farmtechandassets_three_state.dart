// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_three_bloc.dart';

/// Represents the state of AddFarmtechandassetsThree in the application.
class AddFarmtechandassetsThreeState extends Equatable {
  AddFarmtechandassetsThreeState({
    this.searchController,
    this.usableConditionController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.addFarmtechandassetsThreeModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? usableConditionController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  AddFarmtechandassetsThreeModel? addFarmtechandassetsThreeModelObj;

  @override
  List<Object?> get props => [
        searchController,
        usableConditionController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        addFarmtechandassetsThreeModelObj,
      ];
  AddFarmtechandassetsThreeState copyWith({
    TextEditingController? searchController,
    TextEditingController? usableConditionController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    AddFarmtechandassetsThreeModel? addFarmtechandassetsThreeModelObj,
  }) {
    return AddFarmtechandassetsThreeState(
      searchController: searchController ?? this.searchController,
      usableConditionController:
          usableConditionController ?? this.usableConditionController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      addFarmtechandassetsThreeModelObj: addFarmtechandassetsThreeModelObj ??
          this.addFarmtechandassetsThreeModelObj,
    );
  }
}
