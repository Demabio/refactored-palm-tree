import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionmodes.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/models/add_financialandservices_seven_model.dart';
part 'add_financialandservices_seven_event.dart';
part 'add_financialandservices_seven_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSeven according to the event that is dispatched to it.
class AddFinancialandservicesSevenBloc extends Bloc<
    AddFinancialandservicesSevenEvent, AddFinancialandservicesSevenState> {
  AddFinancialandservicesSevenBloc(
      AddFinancialandservicesSevenState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSevenInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesSevenModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesSevenModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    ExtensionModeDB farmStructureDB = ExtensionModeDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceMode,
          id: value[i].extensionModeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesSevenState> emit,
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
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      nationalGovernm: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      countyGovernmen: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      ngovalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      privatevalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      televisionvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      relativesvalue: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesSevenInitialEvent event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSevenModelObj:
            state.addFinancialandservicesSevenModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
