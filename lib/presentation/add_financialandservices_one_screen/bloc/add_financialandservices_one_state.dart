// ignore_for_file: must_be_immutable

part of 'add_financialandservices_one_bloc.dart';

/// Represents the state of AddFinancialandservicesOne in the application.
class AddFinancialandservicesOneState extends Equatable {
  AddFinancialandservicesOneState({
    this.selectvalueoneController,
    this.selectedDropDownValue,
    this.addFinancialandservicesOneModelObj,
  });

  TextEditingController? selectvalueoneController;

  SelectionPopupModel? selectedDropDownValue;

  AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj;

  @override
  List<Object?> get props => [
        selectvalueoneController,
        selectedDropDownValue,
        addFinancialandservicesOneModelObj,
      ];
  AddFinancialandservicesOneState copyWith({
    TextEditingController? selectvalueoneController,
    SelectionPopupModel? selectedDropDownValue,
    AddFinancialandservicesOneModel? addFinancialandservicesOneModelObj,
  }) {
    return AddFinancialandservicesOneState(
      selectvalueoneController:
          selectvalueoneController ?? this.selectvalueoneController,
      selectedDropDownValue:
          selectedDropDownValue ?? this.selectedDropDownValue,
      addFinancialandservicesOneModelObj: addFinancialandservicesOneModelObj ??
          this.addFinancialandservicesOneModelObj,
    );
  }
}
