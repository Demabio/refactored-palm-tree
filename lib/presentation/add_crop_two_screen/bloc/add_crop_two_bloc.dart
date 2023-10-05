import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropmotive.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropsystem.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropwatersource.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_crop_two_screen/models/add_crop_two_model.dart';
part 'add_crop_two_event.dart';
part 'add_crop_two_state.dart';

/// A bloc that manages the state of a AddCropTwo according to the event that is dispatched to it.
class AddCropTwoBloc extends Bloc<AddCropTwoEvent, AddCropTwoState> {
  AddCropTwoBloc(AddCropTwoState initialState) : super(initialState) {
    on<AddCropTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<ChangeDropDown3Event>(_changeDropDown3);
    on<ChangeDropDown4Event>(_changeDropDown4);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _onInitialize(
    AddCropTwoInitialEvent event,
    Emitter<AddCropTwoState> emit,
  ) async {
    emit(state.copyWith(
        addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
            dropdownItemList: await fetchMotives(),
            dropdownItemList1: await fetchProductionSytems(),
            dropdownItemList2: await fetchWaterSources(),
            dropdownItemList3: fillDropdownItemList3(),
            dropdownItemList4: fillDropdownItemList4())));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue2: event.value));
  }

  _changeDropDown3(
    ChangeDropDown3Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue3: event.value));
  }

  _changeDropDown4(
    ChangeDropDown4Event event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue4: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList2() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList3() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  List<SelectionPopupModel> fillDropdownItemList4() {
    return [
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  Future<List<SelectionPopupModel>> fetchMotives() async {
    List<SelectionPopupModel> list = [];
    CropPlantingMotiveDB cropPlantingMotiveDB = CropPlantingMotiveDB();

    await cropPlantingMotiveDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].cropMotive,
          id: value[i].cropMotiveId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchProductionSytems() async {
    List<SelectionPopupModel> list = [];
    CropSystemDB cropSystemDB = CropSystemDB();

    await cropSystemDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].croppingSystem,
          id: value[i].cropSystemId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchWaterSources() async {
    List<SelectionPopupModel> list = [];
    CropWaterSourceDB cropWaterSourceDB = CropWaterSourceDB();

    await cropWaterSourceDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].waterSource,
          id: value[i].waterSourceId,
        ));
      }
    });
    return list;
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
          stepped: --state.addCropTwoModelObj?.stepped,
          page1: state.addCropTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addCropTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addCropTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addCropTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
          stepped: ++state.addCropTwoModelObj?.stepped,
          page1: state.addCropTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addCropTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addCropTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addCropTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddCropTwoState> emit,
  ) {
    emit(
      state.copyWith(
        addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }
}
