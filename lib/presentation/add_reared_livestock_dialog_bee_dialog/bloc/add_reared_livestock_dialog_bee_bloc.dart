import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/beehivetype.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_bee_dialog/models/add_reared_livestock_dialog_bee_model.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import '/core/app_export.dart';
part 'add_reared_livestock_dialog_bee_event.dart';
part 'add_reared_livestock_dialog_bee_state.dart';

/// A bloc that manages the state of a AddRearedLivestockDialogTwo according to the event that is dispatched to it.
class AddRearedLivestockDialogBeeBloc extends Bloc<
    AddRearedLivestockDialogBeeEvent, AddRearedLivestockDialogBeeState> {
  AddRearedLivestockDialogBeeBloc(AddRearedLivestockDialogBeeState initialState)
      : super(initialState) {
    on<AddRearedLivestockDialogBeeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddAGs>(_addAgeGroups);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) {
    emit(state.copyWith(
      lessThanThreeWe: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) {
    emit(state.copyWith(
      threeToEightWee: event.value,
    ));
  }

  Future<List<FeedsModel>> fetchBees() async {
    List<FeedsModel> list = [];
    LivestockBeehiveTypeDB livestockAgeGroupDB = LivestockBeehiveTypeDB();

    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].beehiveType,
          id: value[i].beehiveTypeId,
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) {
    List<FeedsModel> newModels =
        state.addRearedLivestockDialogTwoModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addRearedLivestockDialogTwoModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) async {
    emit(state.copyWith(
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj?.copyWith(
      ageGroupmModels: await fetchBees(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddAGs event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) {
    List<Map<String, dynamic>> ageGroupMapList =
        event.models.map((ageGroup) => ageGroup.toJson()).toList();

    // Convert the list of maps to a JSON string
    String jsonString = jsonEncode(ageGroupMapList);
    PrefUtils().setBee(jsonString);

    // Create a list of AgeGroupModel objects from the list of dynamic objects

    emit(state.copyWith(
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj));
  }

  _onInitialize(
    AddRearedLivestockDialogBeeInitialEvent event,
    Emitter<AddRearedLivestockDialogBeeState> emit,
  ) async {
    String ages = PrefUtils().getBee();
    List<FeedsModel> agemodels = await fetchBees();
    if (ages != "0") {
      List<dynamic> decageGroupMapList = jsonDecode(ages);

      // Create a list of AgeGroupModel objects from the list of dynamic objects
      agemodels =
          decageGroupMapList.map((json) => FeedsModel.fromJson(json)).toList();
    }
    emit(
      state.copyWith(
        lessThanThreeWe: false,
        threeToEightWee: false,
        addRearedLivestockDialogTwoModelObj:
            state.addRearedLivestockDialogTwoModelObj?.copyWith(
          ageGroupmModels: agemodels,
        ),
      ),
    );
  }
}
