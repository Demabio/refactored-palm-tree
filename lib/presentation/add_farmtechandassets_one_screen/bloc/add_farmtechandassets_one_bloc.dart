import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_one_screen/models/add_farmtechandassets_one_model.dart';
part 'add_farmtechandassets_one_event.dart';
part 'add_farmtechandassets_one_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsOne according to the event that is dispatched to it.
class AddFarmtechandassetsOneBloc
    extends Bloc<AddFarmtechandassetsOneEvent, AddFarmtechandassetsOneState> {
  AddFarmtechandassetsOneBloc(AddFarmtechandassetsOneState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _onInitialize(
    AddFarmtechandassetsOneInitialEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsOneModelObj:
            state.addFarmtechandassetsOneModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFarmtechandassetsOneState> emit,
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
}
