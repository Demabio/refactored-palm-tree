import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/creditsource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/models/add_financialandservices_five_model.dart';
part 'add_financialandservices_five_event.dart';
part 'add_financialandservices_five_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesFive according to the event that is dispatched to it.
class AddFinancialandservicesFiveBloc extends Bloc<
    AddFinancialandservicesFiveEvent, AddFinancialandservicesFiveState> {
  AddFinancialandservicesFiveBloc(AddFinancialandservicesFiveState initialState)
      : super(initialState) {
    on<AddFinancialandservicesFiveInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckBox7Event>(_changeCheckBox7);
    on<ChangeCheckBox8Event>(_changeCheckBox8);
    on<ChangeCheckBox9Event>(_changeCheckBox9);
    on<ChangeCheckBox10Event>(_changeCheckBox10);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesFiveModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesFiveModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    CreditSourceDB farmStructureDB = CreditSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].creditSource,
          id: value[i].creditSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    List<Map<String, dynamic>> ageGroupMapList =
        event.models.map((ageGroup) => ageGroup.toJson()).toList();

    // Convert the list of maps to a JSON string
    String jsonString = jsonEncode(ageGroupMapList);
    PrefUtils().setAgeGroups(jsonString);

    List<dynamic> decageGroupMapList = jsonDecode(jsonString);

    // Create a list of AgeGroupModel objects from the list of dynamic objects
    List<CheckBoxList> ageGroupList =
        decageGroupMapList.map((json) => CheckBoxList.fromJson(json)).toList();

    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      commercialBank: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      businessPartner: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      otherMoneyLende: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      selfSalaryOrSav: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      coorperativesva: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      trashthree: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      trashfour: event.value,
    ));
  }

  _changeCheckBox8(
    ChangeCheckBox8Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      trashfive: event.value,
    ));
  }

  _changeCheckBox9(
    ChangeCheckBox9Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      trashsix: event.value,
    ));
  }

  _changeCheckBox10(
    ChangeCheckBox10Event event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) {
    emit(state.copyWith(
      farmerOrganizat: event.value,
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
    AddFinancialandservicesFiveInitialEvent event,
    Emitter<AddFinancialandservicesFiveState> emit,
  ) async {
    emit(state.copyWith(
      balancehistoryController: TextEditingController(),
      balancehistoryController1: TextEditingController(),
      farmerorganizatController: TextEditingController(),
      commercialBank: false,
      businessPartner: false,
      otherMoneyLende: false,
      trashtwo: false,
      selfSalaryOrSav: false,
      coorperativesva: false,
      trashthree: false,
      trashfour: false,
      trashfive: false,
      trashsix: false,
      farmerOrganizat: false,
    ));
    emit(state.copyWith(
        addFinancialandservicesFiveModelObj:
            state.addFinancialandservicesFiveModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      models: await fetchFarmStructure(),
    )));
  }
}
