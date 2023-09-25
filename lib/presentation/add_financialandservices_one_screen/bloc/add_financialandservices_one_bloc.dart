import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_one_screen/models/add_financialandservices_one_model.dart';
part 'add_financialandservices_one_event.dart';
part 'add_financialandservices_one_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesOne according to the event that is dispatched to it.
class AddFinancialandservicesOneBloc extends Bloc<
    AddFinancialandservicesOneEvent, AddFinancialandservicesOneState> {
  AddFinancialandservicesOneBloc(AddFinancialandservicesOneState initialState)
      : super(initialState) {
    on<AddFinancialandservicesOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  _onInitialize(
    AddFinancialandservicesOneInitialEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) async {
    emit(state.copyWith(
      selectvalueoneController: TextEditingController(),
    ));
    emit(state.copyWith(
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
    )));
  }
}
