import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmassetsource.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/laboursource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_one_screen/models/add_farmtechandassets_one_model.dart';
part 'add_farmtechandassets_one_event.dart';
part 'add_farmtechandassets_one_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsOne according to the event that is dispatched to it.
class AddFarmtechandassetsOneBloc
    extends Bloc<AddFarmtechandassetsOneEvent, AddFarmtechandassetsOneState> {
  AddFarmtechandassetsOneBloc(AddFarmtechandassetsOneState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
  }

  _onInitialize(
    AddFarmtechandassetsOneInitialEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) async {
    emit(state.copyWith(
        addFarmtechandassetsOneModelObj:
            state.addFarmtechandassetsOneModelObj?.copyWith(
      dropdownItemList: await fetchLabourSources(),
      dropdownItemList1: await fetchOwnerships(),
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddFarmtechandassetsOneState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
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

  Future<List<SelectionPopupModel>> fetchOwnerships() async {
    List<SelectionPopupModel> list = [];
    FarmAssetSourceDB farmOwnershipDB = FarmAssetSourceDB();

    await farmOwnershipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].assetSource,
          id: value[i].assetSourceId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchLabourSources() async {
    List<SelectionPopupModel> list = [];
    LabourSourceDB labourSourceDB = LabourSourceDB();

    await labourSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].labourSource,
          id: value[i].labourSourceId,
        ));
      }
    });
    return list;
  }
}
