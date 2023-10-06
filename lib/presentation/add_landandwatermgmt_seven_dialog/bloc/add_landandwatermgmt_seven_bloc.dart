import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_seven_dialog/models/add_landandwatermgmt_seven_model.dart';
part 'add_landandwatermgmt_seven_event.dart';
part 'add_landandwatermgmt_seven_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSeven according to the event that is dispatched to it.
class AddLandandwatermgmtSevenBloc
    extends Bloc<AddLandandwatermgmtSevenEvent, AddLandandwatermgmtSevenState> {
  AddLandandwatermgmtSevenBloc(AddLandandwatermgmtSevenState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSevenInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addLandandwatermgmtSevenModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj?.copyWith(
      models: newModels,
      count: state.addLandandwatermgmtSevenModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    IrrigationAgencyDB farmStructureDB = IrrigationAgencyDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].agencyName,
          id: value[i].irrigationAgencyId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddLandandwatermgmtSevenState> emit,
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
        addLandandwatermgmtSevenModelObj:
            state.addLandandwatermgmtSevenModelObj));
  }

  _onInitialize(
    AddLandandwatermgmtSevenInitialEvent event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) async {
    emit(state.copyWith(
      countyGovernmen: false,
      trash: false,
      implementingAge: false,
      othervalue: false,
      selfPrivate: false,
      trashone: false,
    ));
  }
}
