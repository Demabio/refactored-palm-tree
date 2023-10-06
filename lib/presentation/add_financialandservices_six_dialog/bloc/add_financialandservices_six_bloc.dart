import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/agriculturalinfosource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/models/add_financialandservices_six_model.dart';
part 'add_financialandservices_six_event.dart';
part 'add_financialandservices_six_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSix according to the event that is dispatched to it.
class AddFinancialandservicesSixBloc extends Bloc<
    AddFinancialandservicesSixEvent, AddFinancialandservicesSixState> {
  AddFinancialandservicesSixBloc(AddFinancialandservicesSixState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSixInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesSixModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesSixModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    AgriInfoSourceDB farmStructureDB = AgriInfoSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agriInfoSource,
          id: value[i].agriInfoSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesSixState> emit,
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
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      publicGathering: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      radiovalue: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      internetvalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      extensionMeetin: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesSixInitialEvent event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesSixModelObj:
            state.addFinancialandservicesSixModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
