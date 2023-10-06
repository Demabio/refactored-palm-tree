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
        title: "Yes",
      ),
      SelectionPopupModel(
        id: 0,
        title: "No",
      ),
    ];
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(
      state.copyWith(
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          stepped: --state.addFinancialandservicesOneModelObj?.stepped,
          page1: state.addFinancialandservicesOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addFinancialandservicesOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addFinancialandservicesOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addFinancialandservicesOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(
      state.copyWith(
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          stepped: ++state.addFinancialandservicesOneModelObj?.stepped,
          page1: state.addFinancialandservicesOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addFinancialandservicesOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addFinancialandservicesOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addFinancialandservicesOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddFinancialandservicesOneState> emit,
  ) {
    emit(
      state.copyWith(
        addFinancialandservicesOneModelObj:
            state.addFinancialandservicesOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
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
