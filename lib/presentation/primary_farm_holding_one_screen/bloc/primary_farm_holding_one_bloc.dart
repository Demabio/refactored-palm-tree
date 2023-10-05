import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/cropareaunit.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_one_screen/models/primary_farm_holding_one_model.dart';
part 'primary_farm_holding_one_event.dart';
part 'primary_farm_holding_one_state.dart';

/// A bloc that manages the state of a PrimaryFarmHoldingOne according to the event that is dispatched to it.
class PrimaryFarmHoldingOneBloc
    extends Bloc<PrimaryFarmHoldingOneEvent, PrimaryFarmHoldingOneState> {
  PrimaryFarmHoldingOneBloc(PrimaryFarmHoldingOneState initialState)
      : super(initialState) {
    on<PrimaryFarmHoldingOneInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  List<SelectionPopupModel> fillDropdownItemList() {
    return [
      SelectionPopupModel(id: 1, title: "Item One", isSelected: true),
      SelectionPopupModel(id: 2, title: "Item Two"),
      SelectionPopupModel(id: 3, title: "Item Three")
    ];
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
          stepped: --state.primaryFarmHoldingOneModelObj?.stepped,
          page1: state.primaryFarmHoldingOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.primaryFarmHoldingOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.primaryFarmHoldingOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.primaryFarmHoldingOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
          stepped: ++state.primaryFarmHoldingOneModelObj?.stepped,
          page1: state.primaryFarmHoldingOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.primaryFarmHoldingOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.primaryFarmHoldingOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.primaryFarmHoldingOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
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

  _onInitialize(
    PrimaryFarmHoldingOneInitialEvent event,
    Emitter<PrimaryFarmHoldingOneState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        sizeController: TextEditingController(),
        sizeoneController: TextEditingController(),
        areaController: TextEditingController(),
        sizeLandLeasedController: TextEditingController(),
        sizeLandIdleController: TextEditingController()));
    emit(
      state.copyWith(
        primaryFarmHoldingOneModelObj:
            state.primaryFarmHoldingOneModelObj?.copyWith(
          dropdownItemList: await fetchAreaUnits(),
        ),
      ),
    );
  }
}
