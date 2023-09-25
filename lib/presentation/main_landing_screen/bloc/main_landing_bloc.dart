import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/main_landing_item_model.dart';
import 'package:kiamis_app/presentation/main_landing_screen/models/main_landing_model.dart';
part 'main_landing_event.dart';
part 'main_landing_state.dart';

/// A bloc that manages the state of a MainLanding according to the event that is dispatched to it.
class MainLandingBloc extends Bloc<MainLandingEvent, MainLandingState> {
  MainLandingBloc(MainLandingState initialState) : super(initialState) {
    on<MainLandingInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue: event.value,
    ));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue1: event.value,
    ));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<MainLandingState> emit,
  ) {
    emit(state.copyWith(
      selectedDropDownValue2: event.value,
    ));
  }

  List<MainLandingItemModel> fillMainLandingItemList() {
    return List.generate(6, (index) => MainLandingItemModel());
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

  List<SelectionPopupModel> fillDropdownItemList2() {
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
    MainLandingInitialEvent event,
    Emitter<MainLandingState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
    ));
    emit(state.copyWith(
        mainLandingModelObj: state.mainLandingModelObj?.copyWith(
      mainLandingItemList: fillMainLandingItemList(),
      dropdownItemList: fillDropdownItemList(),
      dropdownItemList1: fillDropdownItemList1(),
      dropdownItemList2: fillDropdownItemList2(),
    )));
  }
}
