import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_three_dialog/models/add_farmtechandassets_three_model.dart';
part 'add_farmtechandassets_three_event.dart';
part 'add_farmtechandassets_three_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsThree according to the event that is dispatched to it.
class AddFarmtechandassetsThreeBloc extends Bloc<AddFarmtechandassetsThreeEvent,
    AddFarmtechandassetsThreeState> {
  AddFarmtechandassetsThreeBloc(AddFarmtechandassetsThreeState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsThreeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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
    AddFarmtechandassetsThreeInitialEvent event,
    Emitter<AddFarmtechandassetsThreeState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
      usableConditionController: TextEditingController(),
    ));
    emit(state.copyWith(
        addFarmtechandassetsThreeModelObj:
            state.addFarmtechandassetsThreeModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }
}
