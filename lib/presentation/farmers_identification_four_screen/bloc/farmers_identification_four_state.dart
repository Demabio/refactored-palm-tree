// ignore_for_file: must_be_immutable

part of 'farmers_identification_four_bloc.dart';

/// Represents the state of FarmersIdentificationFour in the application.
class FarmersIdentificationFourState extends Equatable {
  FarmersIdentificationFourState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.respMob,
    this.respame,
    this.respid,
    this.farmersIdentificationFourModelObj,
  });

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  TextEditingController? respame;

  TextEditingController? respMob;

  TextEditingController? respid;

  FarmersIdentificationFourModel? farmersIdentificationFourModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        respame,
        respMob,
        respid,
        farmersIdentificationFourModelObj,
      ];
  FarmersIdentificationFourState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    TextEditingController? respame,
    TextEditingController? respMob,
    TextEditingController? respid,
    FarmersIdentificationFourModel? farmersIdentificationFourModelObj,
  }) {
    return FarmersIdentificationFourState(
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      selectedDropDownValue3:
          selectedDropDownValue3 ?? this.selectedDropDownValue3,
      selectedDropDownValue4:
          selectedDropDownValue4 ?? this.selectedDropDownValue4,
      farmersIdentificationFourModelObj: farmersIdentificationFourModelObj ??
          this.farmersIdentificationFourModelObj,
      respame: respame ?? this.respame,
      respMob: respMob ?? this.respMob,
      respid: respid ?? this.respid,
    );
  }
}
