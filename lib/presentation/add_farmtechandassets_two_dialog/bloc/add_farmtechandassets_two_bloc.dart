import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_two_dialog/models/add_farmtechandassets_two_model.dart';
part 'add_farmtechandassets_two_event.dart';
part 'add_farmtechandassets_two_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsTwo according to the event that is dispatched to it.
class AddFarmtechandassetsTwoBloc
    extends Bloc<AddFarmtechandassetsTwoEvent, AddFarmtechandassetsTwoState> {
  AddFarmtechandassetsTwoBloc(AddFarmtechandassetsTwoState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsTwoInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      animalDraft: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      gridElectricity: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      manualvalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      solarvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) {
    emit(state.copyWith(
      windvalue: event.value,
    ));
  }

  _onInitialize(
    AddFarmtechandassetsTwoInitialEvent event,
    Emitter<AddFarmtechandassetsTwoState> emit,
  ) async {
    emit(state.copyWith(
      animalDraft: false,
      gridElectricity: false,
      manualvalue: false,
      trash: false,
      othervalue: false,
      solarvalue: false,
      windvalue: false,
    ));
  }
}
