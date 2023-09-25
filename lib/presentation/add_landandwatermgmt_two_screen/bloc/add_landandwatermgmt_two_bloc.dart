import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_two_screen/models/add_landandwatermgmt_two_model.dart';
part 'add_landandwatermgmt_two_event.dart';
part 'add_landandwatermgmt_two_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtTwo according to the event that is dispatched to it.
class AddLandandwatermgmtTwoBloc
    extends Bloc<AddLandandwatermgmtTwoEvent, AddLandandwatermgmtTwoState> {
  AddLandandwatermgmtTwoBloc(AddLandandwatermgmtTwoState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
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
    AddLandandwatermgmtTwoInitialEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) async {
    emit(state.copyWith(
      areavalueoneController: TextEditingController(),
    ));
    emit(state.copyWith(
        addLandandwatermgmtTwoModelObj:
            state.addLandandwatermgmtTwoModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
    )));
  }
}
