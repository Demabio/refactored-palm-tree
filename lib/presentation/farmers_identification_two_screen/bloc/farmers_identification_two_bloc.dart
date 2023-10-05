import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_two_screen/models/farmers_identification_two_model.dart';
part 'farmers_identification_two_event.dart';
part 'farmers_identification_two_state.dart';

/// A bloc that manages the state of a FarmersIdentificationTwo according to the event that is dispatched to it.
class FarmersIdentificationTwoBloc
    extends Bloc<FarmersIdentificationTwoEvent, FarmersIdentificationTwoState> {
  FarmersIdentificationTwoBloc(FarmersIdentificationTwoState initialState)
      : super(initialState) {
    on<FarmersIdentificationTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    int currentYear = DateTime.now().year;
    List<SelectionPopupModel> itemList = [];

// Area for business logic
    for (int year = currentYear; year >= currentYear - 120; year--) {
      itemList.add(SelectionPopupModel(id: year, title: "$year"));
    }

    return itemList;
  }

  List<SelectionPopupModel> fillDropdownItemList1() {
    return [
      SelectionPopupModel(id: 1, title: "Male", isSelected: true),
      SelectionPopupModel(id: 2, title: "Female"),
    ];
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          stepped: --state.farmersIdentificationTwoModelObj?.stepped,
          page1: state.farmersIdentificationTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          stepped: ++state.farmersIdentificationTwoModelObj?.stepped,
          page1: state.farmersIdentificationTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationTwoModelObj:
            state.farmersIdentificationTwoModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  _onInitialize(
    FarmersIdentificationTwoInitialEvent event,
    Emitter<FarmersIdentificationTwoState> emit,
  ) async {
    emit(state.copyWith(
        idnumberoneController: TextEditingController(),
        mobileNumberController: TextEditingController(),
        emailController: TextEditingController(),
        addressController: TextEditingController()));
    emit(state.copyWith(
        farmersIdentificationTwoModelObj: state.farmersIdentificationTwoModelObj
            ?.copyWith(
                dropdownItemList: fillDropdownItemList(),
                dropdownItemList1: fillDropdownItemList1())));
  }
}
