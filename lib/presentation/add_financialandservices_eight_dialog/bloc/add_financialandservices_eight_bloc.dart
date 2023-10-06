import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/extensionsources.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/models/add_financialandservices_eight_model.dart';
part 'add_financialandservices_eight_event.dart';
part 'add_financialandservices_eight_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesEight according to the event that is dispatched to it.
class AddFinancialandservicesEightBloc extends Bloc<
    AddFinancialandservicesEightEvent, AddFinancialandservicesEightState> {
  AddFinancialandservicesEightBloc(
      AddFinancialandservicesEightState initialState)
      : super(initialState) {
    on<AddFinancialandservicesEightInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesEightModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesEightModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    ExtensionSourceDB farmStructureDB = ExtensionSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].sourceType,
          id: value[i].extensionSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesEightState> emit,
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
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      eExtension: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      faceToFace: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      farmerFieldScho: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      peerToPeer: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesEightInitialEvent event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesEightModelObj:
            state.addFinancialandservicesEightModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
