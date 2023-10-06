import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmstructures.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_four_dialog/models/add_farmtechandassets_four_model.dart';
part 'add_farmtechandassets_four_event.dart';
part 'add_farmtechandassets_four_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsFour according to the event that is dispatched to it.
class AddFarmtechandassetsFourBloc
    extends Bloc<AddFarmtechandassetsFourEvent, AddFarmtechandassetsFourState> {
  AddFarmtechandassetsFourBloc(AddFarmtechandassetsFourState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsFourInitialEvent>(_onInitialize);

    on<ChangeCheckBox13Event>(_changeCheckBox13);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox13(
    ChangeCheckBox13Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      traditionalGran: event.value,
    ));
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFarmtechandassetsFourModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: newModels,
      count: state.addFarmtechandassetsFourModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    FarmStructureDB farmStructureDB = FarmStructureDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].structureName,
          id: value[i].farmStructureId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFarmtechandassetsFourState> emit,
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
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj));
  }

  _onInitialize(
    AddFarmtechandassetsFourInitialEvent event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsFourModelObj:
            state.addFarmtechandassetsFourModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
