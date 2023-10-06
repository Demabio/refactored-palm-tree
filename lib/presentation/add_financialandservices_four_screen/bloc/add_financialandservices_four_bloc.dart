import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/cooperativegroups.dart';
import '../models/irrigationprojetmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/models/add_financialandservices_four_model.dart';
part 'add_financialandservices_four_event.dart';
part 'add_financialandservices_four_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesFour according to the event that is dispatched to it.
class AddFinancialandservicesFourBloc extends Bloc<
    AddFinancialandservicesFourEvent, AddFinancialandservicesFourState> {
  AddFinancialandservicesFourBloc(AddFinancialandservicesFourState initialState)
      : super(initialState) {
    on<AddFinancialandservicesFourInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeAgeGroupCheckbox>(_changeAgeGroupCB);
    on<ResetCBs>(_resetCBs);

    on<AddAGs>(_addAgeGroups);
  }

  _changeAgeGroupCB(
    ChangeAgeGroupCheckbox event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    List<IrrigationProjectModel> newModels =
        state.addFinancialandservicesFourModelObj!.ageGroupmModels;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      ageGroupmModels: newModels,
      count: state.addFinancialandservicesFourModelObj!.count + 1,
    )));
  }

  _resetCBs(
    ResetCBs event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) async {
    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      ageGroupmModels: await fetchSchemes(),
      count: 0,
    )));
  }

  _addAgeGroups(
    AddAGs event,
    Emitter<AddFinancialandservicesFourState> emit,
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
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj));
  }

  Future<List<IrrigationProjectModel>> fetchSchemes() async {
    List<IrrigationProjectModel> list = [];

    List<SelectionPopupModel> dpds = [
      SelectionPopupModel(title: "Full Member", id: 1),
      SelectionPopupModel(title: "Out Grower Member", id: 0),
    ];

    CooperativeGroupDB livestockAgeGroupDB = CooperativeGroupDB();
    TextEditingController stored = TextEditingController();
    stored.value = TextEditingValue(text: "999");
    await livestockAgeGroupDB?.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(IrrigationProjectModel(
          title: value[i].group,
          ageGroupId: value[i].cooperativeGroupId,
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

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trashthree: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trashfour: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) {
    emit(state.copyWith(
      trashfive: event.value,
    ));
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

  _onInitialize(
    AddFinancialandservicesFourInitialEvent event,
    Emitter<AddFinancialandservicesFourState> emit,
  ) async {
    emit(state.copyWith(
      balancehistoryController: TextEditingController(),
      balancehistoryController1: TextEditingController(),
      balancehistoryController2: TextEditingController(),
      balancehistoryController3: TextEditingController(),
      balancehistoryController4: TextEditingController(),
      balancehistoryController5: TextEditingController(),
      trash: false,
      trashone: false,
      trashtwo: false,
      trashthree: false,
      trashfour: false,
      trashfive: false,
    ));
    emit(state.copyWith(
        addFinancialandservicesFourModelObj:
            state.addFinancialandservicesFourModelObj?.copyWith(
      dropdownItemList: fillDropdownItemList(),
      ageGroupmModels: await fetchSchemes(),
    )));
  }
}
