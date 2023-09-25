// ignore_for_file: must_be_immutable

part of 'farmers_identification_three_bloc.dart';

/// Represents the state of FarmersIdentificationThree in the application.
class FarmersIdentificationThreeState extends Equatable {
  FarmersIdentificationThreeState({
    this.codevalueoneController,
    this.hhsizevalueoneController,
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.farmersIdentificationThreeModelObj,
  });

  TextEditingController? codevalueoneController;

  TextEditingController? hhsizevalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  FarmersIdentificationThreeModel? farmersIdentificationThreeModelObj;

  @override
  List<Object?> get props => [
        codevalueoneController,
        hhsizevalueoneController,
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        farmersIdentificationThreeModelObj,
      ];
  FarmersIdentificationThreeState copyWith({
    TextEditingController? codevalueoneController,
    TextEditingController? hhsizevalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    FarmersIdentificationThreeModel? farmersIdentificationThreeModelObj,
  }) {
    return FarmersIdentificationThreeState(
      codevalueoneController:
          codevalueoneController ?? this.codevalueoneController,
      hhsizevalueoneController:
          hhsizevalueoneController ?? this.hhsizevalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      selectedDropDownValue1:
          selectedDropDownValue1 ?? this.selectedDropDownValue1,
      selectedDropDownValue2:
          selectedDropDownValue2 ?? this.selectedDropDownValue2,
      farmersIdentificationThreeModelObj: farmersIdentificationThreeModelObj ??
          this.farmersIdentificationThreeModelObj,
    );
  }
}
