import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/respondentrelationship.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_four_screen/models/farmers_identification_four_model.dart';
part 'farmers_identification_four_event.dart';
part 'farmers_identification_four_state.dart';

/// A bloc that manages the state of a FarmersIdentificationFour according to the event that is dispatched to it.
class FarmersIdentificationFourBloc extends Bloc<FarmersIdentificationFourEvent,
    FarmersIdentificationFourState> {
  FarmersIdentificationFourBloc(FarmersIdentificationFourState initialState)
      : super(initialState) {
    on<FarmersIdentificationFourInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _onInitialize(
    FarmersIdentificationFourInitialEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) async {
    emit(
      state.copyWith(
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          dropdownItemList: fillDropdownItemList(),
          dropdownItemList1: await fetchRespondentRelationships(),
          dropdownItemList2: fillDropdownItemList2(),
          dropdownItemList3: fillDropdownItemList3(),
          dropdownItemList4: fillDropdownItemList4(),
        ),
      ),
    );
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(
        selectedDropDownValue: event.value,
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          isFarmer: event.value.id == 1,
        )));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue2: event.value));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue3: event.value));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue4: event.value));
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          stepped: --state.farmersIdentificationFourModelObj?.stepped,
          page1: state.farmersIdentificationFourModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationFourModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationFourModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationFourModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          stepped: ++state.farmersIdentificationFourModelObj?.stepped,
          page1: state.farmersIdentificationFourModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationFourModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationFourModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationFourModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmersIdentificationFourState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationFourModelObj:
            state.farmersIdentificationFourModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  Future<List<SelectionPopupModel>> fetchRespondentRelationships() async {
    List<SelectionPopupModel> list = [];
    RespondentRelationshipDB relationshipDB = RespondentRelationshipDB();

    await relationshipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].rlshpToFarmer,
          id: value[i].respondendRlshpId,
        ));
      }
    });
    return list;
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No"),
    ];
  }
}
