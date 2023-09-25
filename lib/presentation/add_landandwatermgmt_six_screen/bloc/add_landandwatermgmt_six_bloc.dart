import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/models/add_landandwatermgmt_six_model.dart';
part 'add_landandwatermgmt_six_event.dart';
part 'add_landandwatermgmt_six_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSix according to the event that is dispatched to it.
class AddLandandwatermgmtSixBloc
    extends Bloc<AddLandandwatermgmtSixEvent, AddLandandwatermgmtSixState> {
  AddLandandwatermgmtSixBloc(AddLandandwatermgmtSixState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSixInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    emit(state.copyWith(
      communityScheme: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
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

  List<SelectionPopupModel> fillDropdownItemList1() {
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
    AddLandandwatermgmtSixInitialEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) async {
    emit(state.copyWith(
      continueController: TextEditingController(),
      balancehistoryController: TextEditingController(),
      arrowdownController: TextEditingController(),
      balancehistoryController1: TextEditingController(),
      arrowdownoneController: TextEditingController(),
      schemevalueController: TextEditingController(),
      arrowdowntwoController: TextEditingController(),
      trash: false,
      communityScheme: false,
      trashone: false,
    ));
    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
    )));
  }
}
