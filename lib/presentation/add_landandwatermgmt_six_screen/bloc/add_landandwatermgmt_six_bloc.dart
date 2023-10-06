import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/dbModels/irrigation/irrigationagencies.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/irrigation/irrigationagencies.dart';
import '../models/irrigationprojetmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/models/add_landandwatermgmt_six_model.dart';
part 'add_landandwatermgmt_six_event.dart';
part 'add_landandwatermgmt_six_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSix according to the event that is dispatched to it.
class AddLandandwatermgmtSixBloc
    extends Bloc<AddLandandwatermgmtSixEvent, AddLandandwatermgmtSixState> {
  AddLandandwatermgmtSixBloc(AddLandandwatermgmtSixState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSixInitialEvent>(_onInitialize);
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddAGs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    List<IrrigationProjectModel> newModels =
        state.addLandandwatermgmtSixModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addLandandwatermgmtSixModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) async {
    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      ageGroupmModels: await fetchSchemes(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddAGs event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) {
    List<Map<String, dynamic>> ageGroupMapList =
        event.models.map((ageGroup) => ageGroup.toJson()).toList();

    // Convert the list of maps to a JSON string
    String jsonString = jsonEncode(ageGroupMapList);
    PrefUtils().setAgeGroups(jsonString);

    List<dynamic> decageGroupMapList = jsonDecode(jsonString);

    // Create a list of AgeGroupModel objects from the list of dynamic objects
    List<IrrigationProjectModel> ageGroupList = decageGroupMapList
        .map((json) => IrrigationProjectModel.fromJson(json))
        .toList();

    emit(state.copyWith(
        addLandandwatermgmtSixModelObj: state.addLandandwatermgmtSixModelObj));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(
        id: 1,
        title: "Item One",
        isSelected: true,
      ),
      SelectionPopupModel(
        id: 2,
        title: "Item Two",
      ),
      SelectionPopupModel(
        id: 3,
        title: "Item Three",
      )
    ];
  }

  Future<List<IrrigationProjectModel>> fetchSchemes() async {
    List<IrrigationProjectModel> list = [];

    List<SelectionPopupModel> dpds = [
      SelectionPopupModel(title: "Full Member", id: 1),
      SelectionPopupModel(title: "Out Grower Member", id: 0),
    ];

    IrrigationAgencyDB livestockAgeGroupDB = IrrigationAgencyDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(IrrigationProjectModel(
          title: value[i].agencyName,
          ageGroupId: value[i].irrigationAgencyId,
          female: TextEditingController(),
          male: TextEditingController(),
          focusNode: FocusNode(),
          femalefocusNode: FocusNode(),
          model: dpds,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    AddLandandwatermgmtSixInitialEvent event,
    Emitter<AddLandandwatermgmtSixState> emit,
  ) async {
    emit(state.copyWith(
      continueController: TextEditingController(),
      balancehistoryController: TextEditingController(),
      arrowdownController: TextEditingController(),
      balancehistoryController1: TextEditingController(),
      arrowdownoneController: TextEditingController(),
      schemevalueController: TextEditingController(),
      arrowdowntwoController: TextEditingController(),
      trash: false,
      communityScheme: false,
      trashone: false,
    ));
    emit(state.copyWith(
        addLandandwatermgmtSixModelObj:
            state.addLandandwatermgmtSixModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      ageGroupmModels: await fetchSchemes(),
    )));
  }
}
