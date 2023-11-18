// ignore_for_file: must_be_immutable

part of 'add_aquaculture_four_bloc.dart';

/// Represents the state of AddAquacultureFour in the application.
class AddAquacultureFourState extends Equatable {
  AddAquacultureFourState({
    this.selectedDropDownValue,
    this.selectedDropDownValue1,
    this.selectedDropDownValue2,
    this.selectedDropDownValue3,
    this.selectedDropDownValue4,
    this.selectedDropDownValue5,
    this.addAquacultureFourModelObj,
    this.inp1,
    this.inp2,
    this.inp3,
    this.inp4,
    this.other,
  });

  TextEditingController? inp1;
  TextEditingController? inp2;
  TextEditingController? inp3;
  TextEditingController? inp4;

  TextEditingController? other;

  SelectionPopupModel? selectedDropDownValue;

  SelectionPopupModel? selectedDropDownValue1;

  SelectionPopupModel? selectedDropDownValue2;

  SelectionPopupModel? selectedDropDownValue3;

  SelectionPopupModel? selectedDropDownValue4;

  SelectionPopupModel? selectedDropDownValue5;

  AddAquacultureFourModel? addAquacultureFourModelObj;

  @override
  List<Object?> get props => [
        selectedDropDownValue,
        selectedDropDownValue1,
        selectedDropDownValue2,
        selectedDropDownValue3,
        selectedDropDownValue4,
        selectedDropDownValue5,
        addAquacultureFourModelObj,
        inp1,
        inp2,
        inp3,
        inp4,
        other,
      ];
  AddAquacultureFourState copyWith({
    SelectionPopupModel? selectedDropDownValue,
    SelectionPopupModel? selectedDropDownValue1,
    SelectionPopupModel? selectedDropDownValue2,
    SelectionPopupModel? selectedDropDownValue3,
    SelectionPopupModel? selectedDropDownValue4,
    SelectionPopupModel? selectedDropDownValue5,
    AddAquacultureFourModel? addAquacultureFourModelObj,
    TextEditingController? inp1,
    TextEditingController? inp2,
    TextEditingController? inp3,
    TextEditingController? inp4,
    TextEditingController? other,
  }) {
    return AddAquacultureFourState(
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
      selectedDropDownValue5:
          selectedDropDownValue5 ?? this.selectedDropDownValue5,
      addAquacultureFourModelObj:
          addAquacultureFourModelObj ?? this.addAquacultureFourModelObj,
      inp1: inp1 ?? this.inp1,
      inp2: inp2 ?? this.inp2,
      inp3: inp3 ?? this.inp3,
      inp4: inp4 ?? this.inp4,
      other: other ?? this.other,
    );
  }
}
