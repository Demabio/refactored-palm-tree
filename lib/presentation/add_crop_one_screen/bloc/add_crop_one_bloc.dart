import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import '/core/app_export.dart';
import '../models/chipviewalbert_item_model.dart';
import 'package:kiamis_app/presentation/add_crop_one_screen/models/add_crop_one_model.dart';
part 'add_crop_one_event.dart';
part 'add_crop_one_state.dart';

/// A bloc that manages the state of a AddCropOne according to the event that is dispatched to it.
class AddCropOneBloc extends Bloc<AddCropOneEvent, AddCropOneState> {
  AddCropOneBloc(AddCropOneState initialState) : super(initialState) {
    on<AddCropOneInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
    on<SearchEventCrop>(_searchCrops);
    on<ReturnCommonEventCrop>(_restoreCommon);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    // List<ChipviewalbertItemModel> newList = List<ChipviewalbertItemModel>.from(
    //     state.addCropOneModelObj!.chipviewalbertItemList);
    // newList[event.index] =
    //     newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: null,
      search: false,
    )));

    SelectionPopupModel? categorymodel =
        state.addCropOneModelObj?.dropdownItemList.firstWhere(
      (model) => model.id == event.model!.cropId,
    );

    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: categorymodel,
    )));
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue2: event.value));
  }

  List<ChipviewalbertItemModel> fillChipviewalbertItemList() {
    return List.generate(9, (index) => ChipviewalbertItemModel());
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
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(
      state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
          stepped: --state.addCropOneModelObj?.stepped,
          page1: state.addCropOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addCropOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addCropOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addCropOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(
      state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
          stepped: ++state.addCropOneModelObj?.stepped,
          page1: state.addCropOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addCropOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addCropOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addCropOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddCropOneState> emit,
  ) {
    emit(
      state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  _searchCrops(
    SearchEventCrop event,
    Emitter<AddCropOneState> emit,
  ) async {
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: state.addCropOneModelObj?.selectedCrop,
      search: true,
      searchValues: await searchCrop(event.value),
    )));
  }

  _restoreCommon(
    ReturnCommonEventCrop event,
    Emitter<AddCropOneState> emit,
  ) async {
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
      selectedCrop: state.addCropOneModelObj?.selectedCrop,
      search: false,
    )));
  }

  Future<List<SelectionPopupModel>> fetchAreaUnits() async {
    List<SelectionPopupModel> list = [];
    CropAreaUnitDB areaUnitDB = CropAreaUnitDB();

    await areaUnitDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].areaUnit,
          id: value[i].areaUnitId,
        ));
      }
    });
    return list;
  }

  Future<List<SelectionPopupModel>> fetchCrops() async {
    List<SelectionPopupModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].crop,
          id: value[i].cropId,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewalbertItemModel>> fetchCommonCrops() async {
    List<ChipviewalbertItemModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.fetchCommonCrops().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewalbertItemModel(
          albertcrop: value[i].crop,
          cropId: value[i].cropId,
        ));
      }
    });
    return list;
  }

  Future<List<ChipviewalbertItemModel>> searchCrop(String crop) async {
    List<ChipviewalbertItemModel> list = [];
    CropDB cropDB = CropDB();

    await cropDB.searchCrops(crop).then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(ChipviewalbertItemModel(
          albertcrop: value[i].crop,
          cropId: value[i].cropId,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    AddCropOneInitialEvent event,
    Emitter<AddCropOneState> emit,
  ) async {
    emit(state.copyWith(
        searchController: TextEditingController(),
        areavalueoneController: TextEditingController()));
    emit(state.copyWith(
        addCropOneModelObj: state.addCropOneModelObj?.copyWith(
            chipviewalbertItemList: await fetchCommonCrops(),
            dropdownItemList: await fetchCrops(),
            dropdownItemList1: await fetchAreaUnits(),
            dropdownItemList2: fillDropdownItemList2())));
  }
}
