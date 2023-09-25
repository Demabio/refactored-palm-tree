import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/add_crop_two_screen/models/add_crop_two_model.dart';part 'add_crop_two_event.dart';part 'add_crop_two_state.dart';/// A bloc that manages the state of a AddCropTwo according to the event that is dispatched to it.
class AddCropTwoBloc extends Bloc<AddCropTwoEvent, AddCropTwoState> {AddCropTwoBloc(AddCropTwoState initialState) : super(initialState) { on<AddCropTwoInitialEvent>(_onInitialize); on<ChangeDropDownEvent>(_changeDropDown); on<ChangeDropDown1Event>(_changeDropDown1); on<ChangeDropDown2Event>(_changeDropDown2); on<ChangeDropDown3Event>(_changeDropDown3); on<ChangeDropDown4Event>(_changeDropDown4); }

_onInitialize(AddCropTwoInitialEvent event, Emitter<AddCropTwoState> emit, ) async  { emit(state.copyWith(addCropTwoModelObj: state.addCropTwoModelObj?.copyWith(dropdownItemList: fillDropdownItemList(), dropdownItemList1: fillDropdownItemList1(), dropdownItemList2: fillDropdownItemList2(), dropdownItemList3: fillDropdownItemList3(), dropdownItemList4: fillDropdownItemList4()))); } 
_changeDropDown(ChangeDropDownEvent event, Emitter<AddCropTwoState> emit, ) { emit(state.copyWith(selectedDropDownValue: event.value)); } 
_changeDropDown1(ChangeDropDown1Event event, Emitter<AddCropTwoState> emit, ) { emit(state.copyWith(selectedDropDownValue1: event.value)); } 
_changeDropDown2(ChangeDropDown2Event event, Emitter<AddCropTwoState> emit, ) { emit(state.copyWith(selectedDropDownValue2: event.value)); } 
_changeDropDown3(ChangeDropDown3Event event, Emitter<AddCropTwoState> emit, ) { emit(state.copyWith(selectedDropDownValue3: event.value)); } 
_changeDropDown4(ChangeDropDown4Event event, Emitter<AddCropTwoState> emit, ) { emit(state.copyWith(selectedDropDownValue4: event.value)); } 
List<SelectionPopupModel> fillDropdownItemList() { return [SelectionPopupModel(id: 1, title: "Item One", isSelected: true), SelectionPopupModel(id: 2, title: "Item Two"), SelectionPopupModel(id: 3, title: "Item Three")]; } 
List<SelectionPopupModel> fillDropdownItemList1() { return [SelectionPopupModel(id: 1, title: "Item One", isSelected: true), SelectionPopupModel(id: 2, title: "Item Two"), SelectionPopupModel(id: 3, title: "Item Three")]; } 
List<SelectionPopupModel> fillDropdownItemList2() { return [SelectionPopupModel(id: 1, title: "Item One", isSelected: true), SelectionPopupModel(id: 2, title: "Item Two"), SelectionPopupModel(id: 3, title: "Item Three")]; } 
List<SelectionPopupModel> fillDropdownItemList3() { return [SelectionPopupModel(id: 1, title: "Item One", isSelected: true), SelectionPopupModel(id: 2, title: "Item Two"), SelectionPopupModel(id: 3, title: "Item Three")]; } 
List<SelectionPopupModel> fillDropdownItemList4() { return [SelectionPopupModel(id: 1, title: "Item One", isSelected: true), SelectionPopupModel(id: 2, title: "Item Two"), SelectionPopupModel(id: 3, title: "Item Three")]; } 
 }
