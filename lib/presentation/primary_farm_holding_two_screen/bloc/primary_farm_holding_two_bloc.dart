import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/farm/farmownership.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/other/enterpirses.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/enterprisesmodel.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/models/primary_farm_holding_two_model.dart';
part 'primary_farm_holding_two_event.dart';
part 'primary_farm_holding_two_state.dart';

/// A bloc that manages the state of a PrimaryFarmHoldingTwo according to the event that is dispatched to it.
class PrimaryFarmHoldingTwoBloc
    extends Bloc<PrimaryFarmHoldingTwoEvent, PrimaryFarmHoldingTwoState> {
  PrimaryFarmHoldingTwoBloc(PrimaryFarmHoldingTwoState initialState)
      : super(initialState) {
    on<PrimaryFarmHoldingTwoInitialEvent>(_onInitialize);
    on<ChangeDropDownEvent>(_changeDropDown);
    on<ChangeDropDown1Event>(_changeDropDown1);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
    on<ChangeEnterprisesCheckbox>(_changeEnterpriseCB);
  }

  _changeDropDown(
    ChangeDropDownEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue: event.value));
  }

  _changeDropDown1(
    ChangeDropDown1Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(selectedDropDownValue1: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(aquacultureForS: event.value));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(trash: event.value));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(growingCropsFor: event.value));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(trashone: event.value));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(trashtwo: event.value));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(trashthree: event.value));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(state.copyWith(treeFarming: event.value));
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
      SelectionPopupModel(id: 1, title: "Yes"),
      SelectionPopupModel(id: 0, title: "No")
    ];
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          stepped: --state.primaryFarmHoldingTwoModelObj?.stepped,
          page1: state.primaryFarmHoldingTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.primaryFarmHoldingTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.primaryFarmHoldingTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.primaryFarmHoldingTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          stepped: ++state.primaryFarmHoldingTwoModelObj?.stepped,
          page1: state.primaryFarmHoldingTwoModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.primaryFarmHoldingTwoModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.primaryFarmHoldingTwoModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.primaryFarmHoldingTwoModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    emit(
      state.copyWith(
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  _changeEnterpriseCB(
    ChangeEnterprisesCheckbox event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) {
    List<EnterpriseModel> newModels =
        state.primaryFarmHoldingTwoModelObj!.enterprises;

    newModels[event.value].isSelected = event.selected!;

    emit(state.copyWith(
        primaryFarmHoldingTwoModelObj:
            state.primaryFarmHoldingTwoModelObj?.copyWith(
      enterprises: newModels,
      count: state.primaryFarmHoldingTwoModelObj!.count + 1,
    )));
  }

  Future<List<SelectionPopupModel>> fetchOwnerships() async {
    List<SelectionPopupModel> list = [];
    FarmerFarmOwnershipDB farmOwnershipDB = FarmerFarmOwnershipDB();

    await farmOwnershipDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(SelectionPopupModel(
          title: value[i].ownershipDesc,
          id: value[i].ownershipId,
        ));
      }
    });
    return list;
  }

  Future<List<EnterpriseModel>> fetchEnterprises() async {
    List<EnterpriseModel> list = [];
    EnterprisesDB enterprisesDB = EnterprisesDB();

    await enterprisesDB.fetchAll().then((value) {
      for (int i = 0; i < value.length; i++) {
        list.add(EnterpriseModel(
          title: value[i].enterpriseDesc,
          enterpriseId: value[i].enterpriseId,
        ));
      }
    });
    return list;
  }

  _onInitialize(
    PrimaryFarmHoldingTwoInitialEvent event,
    Emitter<PrimaryFarmHoldingTwoState> emit,
  ) async {
    emit(state.copyWith(
        titleoneController: TextEditingController(),
        titlethreeController: TextEditingController(),
        titlesevenController: TextEditingController(),
        aquacultureForS: false,
        trash: false,
        growingCropsFor: false,
        trashone: false,
        trashtwo: false,
        trashthree: false,
        treeFarming: false));
    emit(state.copyWith(
        primaryFarmHoldingTwoModelObj: state.primaryFarmHoldingTwoModelObj
            ?.copyWith(
                enterprises: await fetchEnterprises(),
                dropdownItemList: await fetchOwnerships(),
                dropdownItemList1: fillDropdownItemList1())));
  }
}
