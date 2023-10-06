import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmpowersource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_two_dialog/models/add_farmtechandassets_two_model.dart';
part 'add_farmtechandassets_two_event.dart';
part 'add_farmtechandassets_two_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsTwo according to the event that is dispatched to it.
class AddFarmtechandassetsTwoBloc
    extends Bloc<AddFarmtechandassetsTwoEvent, AddFarmtechandassetsTwoState> {
  AddFarmtechandassetsTwoBloc(AddFarmtechandassetsTwoState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsTwoInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      animalDraft: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      gridElectricity: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      manualvalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      solarvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      windvalue: event.value,
    ));
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFarmtechandassetsTwoModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: newModels,
      count: state.addFarmtechandassetsTwoModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: await fetchPowerSources(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsTwoState> emit,
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
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj));
  }

  Future<List<CheckBoxList>> fetchPowerSources() async {
    List<CheckBoxList> list = [];
    FarmPowerSourceDB powerSourceDB = FarmPowerSourceDB();

    await powerSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].powerSource,
          id: value[i].powerSourceId,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    AddFarmtechandassetsTwoInitialEvent event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsTwoModelObj:
            state.addFarmtechandassetsTwoModelObj?.copyWith(
      models: await fetchPowerSources(),
    )));
  }
}
