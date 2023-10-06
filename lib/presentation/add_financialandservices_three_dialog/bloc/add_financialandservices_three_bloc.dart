import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/models/customwidgets/checkboxlist.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/incomesource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_three_dialog/models/add_financialandservices_three_model.dart';
part 'add_financialandservices_three_event.dart';
part 'add_financialandservices_three_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesThree according to the event that is dispatched to it.
class AddFinancialandservicesThreeBloc extends Bloc<
    AddFinancialandservicesThreeEvent, AddFinancialandservicesThreeState> {
  AddFinancialandservicesThreeBloc(
      AddFinancialandservicesThreeState initialState)
      : super(initialState) {
    on<AddFinancialandservicesThreeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckBox7Event>(_changeCheckBox7);
  }

  _changeAgeGroupCB(
    ChangeCheckbox event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    List<CheckBoxList> newModels =
        state.addFinancialandservicesThreeModelObj!.models;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: newModels,
      count: state.addFinancialandservicesThreeModelObj!.count + 1,
    )));
  }

  Future<List<CheckBoxList>> fetchFarmStructure() async {
    List<CheckBoxList> list = [];
    IncomeSourceDB farmStructureDB = IncomeSourceDB();

    await farmStructureDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(CheckBoxList(
          title: value[i].incomeSource,
          id: value[i].incomeSourceId,
        ));
      }
    });
    return list;
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: await fetchFarmStructure(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddCBs event,
    Emitter<AddFinancialandservicesThreeState> emit,
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
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      nonFarmTrading: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      remittancesvalu: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      pensionvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      otherIncomeSour: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      cashTransfer: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesThreeInitialEvent event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesThreeModelObj:
            state.addFinancialandservicesThreeModelObj?.copyWith(
      models: await fetchFarmStructure(),
    )));
  }
}
