import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishcategory.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/fish/fishproductiontype.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/models/add_aquaculture_three_model.dart';
part 'add_aquaculture_three_event.dart';
part 'add_aquaculture_three_state.dart';

/// A bloc that manages the state of a AddAquacultureThree according to the event that is dispatched to it.
class AddAquacultureThreeBloc
    extends Bloc<AddAquacultureThreeEvent, AddAquacultureThreeState> {
  AddAquacultureThreeBloc(AddAquacultureThreeState initialState)
      : super(initialState) {
    on<AddAquacultureThreeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  Future<List<CheckBoxList>> fetchFeeds() async {
    List<CheckBoxList> list = [];
    FishCategoryDB fishCategoryDB = FishCategoryDB();
    TextEditingController stored = TextEditingController();

    await fishCategoryDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].fishCategory,
          id: value[i].fishCategoryId,
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    List<CheckBoxList> newModels = state.addAquacultureThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: newModels,
      count: state.addAquacultureThreeModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddAquacultureThreeState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: await fetchFeeds(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddAquacultureThreeState> emit,
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
        addAquacultureThreeModelObj: state.addAquacultureThreeModelObj));
  }

  _onInitialize(
    AddAquacultureThreeInitialEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) async {
    emit(state.copyWith(
        addAquacultureThreeModelObj:
            state.addAquacultureThreeModelObj?.copyWith(
      models: await fetchFeeds(),
    )));
  }
}
