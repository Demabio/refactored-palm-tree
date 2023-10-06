import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationtypes.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_five_dialog/models/add_landandwatermgmt_five_model.dart';
part 'add_landandwatermgmt_five_event.dart';
part 'add_landandwatermgmt_five_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtFive according to the event that is dispatched to it.
class AddLandandwatermgmtFiveBloc
    extends Bloc<AddLandandwatermgmtFiveEvent, AddLandandwatermgmtFiveState> {
  AddLandandwatermgmtFiveBloc(AddLandandwatermgmtFiveState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtFiveInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtFiveModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtFiveModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    IrrigationTypeDB farmStructureDB = IrrigationTypeDB();
//        createdBy: int.parse(map['created_by'] ?? "0"),

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].irrigationType,
          id: value[i].irrigationTypeId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtFiveState> emit,
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
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj));
  }

  _onInitialize(
    AddLandandwatermgmtFiveInitialEvent event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtFiveModelObj:
            state.addLandandwatermgmtFiveModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
