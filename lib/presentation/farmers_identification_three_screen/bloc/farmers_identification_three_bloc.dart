import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_three_screen/models/farmers_identification_three_model.dart';
part 'farmers_identification_three_event.dart';
part 'farmers_identification_three_state.dart';

/// A bloc that manages the state of a FarmersIdentificationThree according to the event that is dispatched to it.
class FarmersIdentificationThreeBloc extends Bloc<
    FarmersIdentificationThreeEvent, FarmersIdentificationThreeState> {
  FarmersIdentificationThreeBloc(FarmersIdentificationThreeState initialState)
      : super(initialState) {
    on<FarmersIdentificationThreeInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeDropDown2Event>(_changeDropDown2);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeDropDown2(
    ChangeDropDown2Event event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue2: event.value));
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

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationThreeModelObj:
            state.farmersIdentificationThreeModelObj?.copyWith(
          stepped: --state.farmersIdentificationThreeModelObj?.stepped,
          page1: state.farmersIdentificationThreeModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationThreeModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationThreeModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationThreeModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationThreeModelObj:
            state.farmersIdentificationThreeModelObj?.copyWith(
          stepped: ++state.farmersIdentificationThreeModelObj?.stepped,
          page1: state.farmersIdentificationThreeModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationThreeModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationThreeModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationThreeModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationThreeModelObj:
            state.farmersIdentificationThreeModelObj?.copyWith(
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
    FarmersIdentificationThreeInitialEvent event,
    Emitter<FarmersIdentificationThreeState> emit,
  ) async {
    emit(state.copyWith(
        codevalueoneController: TextEditingController(),
        hhsizevalueoneController: TextEditingController()));
    emit(state.copyWith(
        farmersIdentificationThreeModelObj:
            state.farmersIdentificationThreeModelObj?.copyWith(
                dropdownItemList: fillDropdownItemList(),
                dropdownItemList1: fillDropdownItemList1(),
                dropdownItemList2: fillDropdownItemList2())));
  }
}
