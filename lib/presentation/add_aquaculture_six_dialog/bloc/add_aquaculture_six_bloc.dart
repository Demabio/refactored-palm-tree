import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/models/add_aquaculture_six_model.dart';
part 'add_aquaculture_six_event.dart';
part 'add_aquaculture_six_state.dart';

/// A bloc that manages the state of a AddAquacultureSix according to the event that is dispatched to it.
class AddAquacultureSixBloc
    extends Bloc<AddAquacultureSixEvent, AddAquacultureSixState> {
  AddAquacultureSixBloc(AddAquacultureSixState initialState)
      : super(initialState) {
    on<AddAquacultureSixInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  Future<List<CheckBoxList>> fetchFeeds() async {
    List<CheckBoxList> list = [];
    FishProductionTypeDB fishProductionTypeDB = FishProductionTypeDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await fishProductionTypeDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishProductionType,
          id: value[i].productionTypeId,
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    List<CheckBoxList> newModels = state.addAquacultureSixModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: newModels,
      count: state.addAquacultureSixModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddAquacultureSixState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: await fetchFeeds(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureSixState> emit,
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
        addAquacultureSixModelObj: state.addAquacultureSixModelObj));
  }

  _onInitialize(
    AddAquacultureSixInitialEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureSixModelObj: state.addAquacultureSixModelObj?.copyWith(
      models: await fetchFeeds(),
    )));
  }
}
