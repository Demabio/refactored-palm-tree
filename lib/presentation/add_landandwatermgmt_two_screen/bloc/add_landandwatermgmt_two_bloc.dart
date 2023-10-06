import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
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
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
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
        title: "Yes",
        isSelected: true,
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

  Future<List<SelectionPopupModel>> fillCategories() async {
    List<SelectionPopupModel> list = [];
    CropAreaUnitDB areaUnitDB = CropAreaUnitDB();
    await areaUnitDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].areaUnit,
          id: value[i].areaUnitId,
        ));
      }
    });
    return list;
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtTwoModelObj:
            state.addLandandwatermgmtTwoModelObj?.copyWith(
          stepped: --state.addLandandwatermgmtTwoModelObj?.stepped,
          page1: state.addLandandwatermgmtTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addLandandwatermgmtTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addLandandwatermgmtTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addLandandwatermgmtTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtTwoModelObj:
            state.addLandandwatermgmtTwoModelObj?.copyWith(
          stepped: ++state.addLandandwatermgmtTwoModelObj?.stepped,
          page1: state.addLandandwatermgmtTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addLandandwatermgmtTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addLandandwatermgmtTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addLandandwatermgmtTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddLandandwatermgmtTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addLandandwatermgmtTwoModelObj:
            state.addLandandwatermgmtTwoModelObj?.copyWith(
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
      dropdownItemList1: await fillCategories(),
    )));
  }
}
