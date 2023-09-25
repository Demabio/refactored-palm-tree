// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_one_bloc.dart';

/// Represents the state of AddFarmtechandassetsOne in the application.
class AddFarmtechandassetsOneState extends Equatable {
  AddFarmtechandassetsOneState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.addFarmtechandassetsOneModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  AddFarmtechandassetsOneModel? addFarmtechandassetsOneModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        addFarmtechandassetsOneModelObj,
      ];
  AddFarmtechandassetsOneState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    AddFarmtechandassetsOneModel? addFarmtechandassetsOneModelObj,
  }) {
    return AddFarmtechandassetsOneState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      addFarmtechandassetsOneModelObj: addFarmtechandassetsOneModelObj ??
          this.addFarmtechandassetsOneModelObj,
    );
  }
}
