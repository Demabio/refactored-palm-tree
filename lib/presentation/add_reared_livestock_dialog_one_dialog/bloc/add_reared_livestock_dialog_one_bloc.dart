import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/livestock/livestockfeedtypes.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/feedsmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_one_dialog/models/add_reared_livestock_dialog_one_model.dart';
part 'add_reared_livestock_dialog_one_event.dart';
part 'add_reared_livestock_dialog_one_state.dart';

/// A bloc that manages the state of a AddRearedLivestockDialogOne according to the event that is dispatched to it.
class AddRearedLivestockDialogOneBloc extends Bloc<
    AddRearedLivestockDialogOneEvent, AddRearedLivestockDialogOneState> {
  AddRearedLivestockDialogOneBloc(AddRearedLivestockDialogOneState initialState)
      : super(initialState) {
    on<AddRearedLivestockDialogOneInitialEvent>(_onInitialize);
    on<ChangeCheckbox>(_changeAgeGroupCB);

    on<ResetCBs>(_resetCBs);
    on<AddCBs>(_addAgeGroups);
  }
  Future<List<FeedsModel>> fetchFeeds() async {
    List<FeedsModel> list = [];
    LivestockFeedTypeDB livestockFeedTypeDB = LivestockFeedTypeDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockFeedTypeDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(FeedsModel(
          title: value[i].feedType,
          id: value[i].feedTypeId,
        ));
      }
    });
    return list;
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddRearedLivestockDialogOneState> emit,
  ) {
    List<FeedsModel> newModels =
        state.addRearedLivestockDialogOneModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addRearedLivestockDialogOneModelObj:
            state.addRearedLivestockDialogOneModelObj?.copyWith(
      models: newModels,
      count: state.addRearedLivestockDialogOneModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddRearedLivestockDialogOneState> emit,
  ) async {
    PrefUtils().setFeeds("0");
    emit(state.copyWith(
        addRearedLivestockDialogOneModelObj:
            state.addRearedLivestockDialogOneModelObj?.copyWith(
      models: await fetchFeeds(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddRearedLivestockDialogOneState> emit,
  ) {
    List<Map<String, dynamic>> ageGroupMapList =
        event.models.map((ageGroup) => ageGroup.toJson()).toList();

    // Convert the list of maps to a JSON string
    String jsonString = jsonEncode(ageGroupMapList);
    PrefUtils().setFeeds(jsonString);

    emit(state.copyWith(
        addRearedLivestockDialogOneModelObj:
            state.addRearedLivestockDialogOneModelObj));
  }

  _onInitialize(
    AddRearedLivestockDialogOneInitialEvent event,
    Emitter<AddRearedLivestockDialogOneState> emit,
  ) async {
    String feeds = PrefUtils().getFeeds();
    List<FeedsModel> feedmodels = await fetchFeeds();
    if (feeds != "0") {
      List<dynamic> decageGroupMapList = jsonDecode(feeds);

      // Create a list of AgeGroupModel objects from the list of dynamic objects
      feedmodels =
          decageGroupMapList.map((json) => FeedsModel.fromJson(json)).toList();
    }

    emit(state.copyWith(
        addRearedLivestockDialogOneModelObj:
            state.addRearedLivestockDialogOneModelObj?.copyWith(
      models: feedmodels,
    )));
  }
}
