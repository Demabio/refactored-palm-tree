import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_one_screen/models/add_landandwatermgmt_one_model.dart';
part 'add_landandwatermgmt_one_event.dart';
part 'add_landandwatermgmt_one_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtOne according to the event that is dispatched to it.
class AddLandandwatermgmtOneBloc
    extends Bloc<AddLandandwatermgmtOneEvent, AddLandandwatermgmtOneState> {
  AddLandandwatermgmtOneBloc(AddLandandwatermgmtOneState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _onInitialize(
    AddLandandwatermgmtOneInitialEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtOneModelObj:
            state.addLandandwatermgmtOneModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
    ));
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtOneModelObj:
            state.addLandandwatermgmtOneModelObj?.copyWith(
          stepped: --state.addLandandwatermgmtOneModelObj?.stepped,
          page1: state.addLandandwatermgmtOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addLandandwatermgmtOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addLandandwatermgmtOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addLandandwatermgmtOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtOneModelObj:
            state.addLandandwatermgmtOneModelObj?.copyWith(
          stepped: ++state.addLandandwatermgmtOneModelObj?.stepped,
          page1: state.addLandandwatermgmtOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addLandandwatermgmtOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addLandandwatermgmtOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addLandandwatermgmtOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddLandandwatermgmtOneState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtOneModelObj:
            state.addLandandwatermgmtOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
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

  List<SelectionPopupModel> fillDropdownItemList1() {
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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
}
