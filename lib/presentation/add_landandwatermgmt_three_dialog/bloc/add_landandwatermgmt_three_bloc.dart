import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_three_dialog/models/add_landandwatermgmt_three_model.dart';
part 'add_landandwatermgmt_three_event.dart';
part 'add_landandwatermgmt_three_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtThree according to the event that is dispatched to it.
class AddLandandwatermgmtThreeBloc
    extends Bloc<AddLandandwatermgmtThreeEvent, AddLandandwatermgmtThreeState> {
  AddLandandwatermgmtThreeBloc(AddLandandwatermgmtThreeState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtThreeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckBox7Event>(_changeCheckBox7);
    on<ChangeCheckBox8Event>(_changeCheckBox8);
    on<ChangeCheckBox9Event>(_changeCheckBox9);
    on<ChangeCheckBox10Event>(_changeCheckBox10);
    on<ChangeCheckBox11Event>(_changeCheckBox11);
    on<ChangeCheckBox12Event>(_changeCheckBox12);
    on<ChangeCheckBox13Event>(_changeCheckBox13);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      biogasProductio: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      mulchingvalue: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      terracingvalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      waterHarvesting: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      fymCompostManur: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      zaiPits: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      cutOffDrains: event.value,
    ));
  }

  _changeCheckBox8(
    ChangeCheckBox8Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _changeCheckBox9(
    ChangeCheckBox9Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox10(
    ChangeCheckBox10Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      minimumTillage: event.value,
    ));
  }

  _changeCheckBox11(
    ChangeCheckBox11Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      deepRipping: event.value,
    ));
  }

  _changeCheckBox12(
    ChangeCheckBox12Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      manuringCompost: event.value,
    ));
  }

  _changeCheckBox13(
    ChangeCheckBox13Event event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) {
    emit(state.copyWith(
      grassStrips: event.value,
    ));
  }

  _onInitialize(
    AddLandandwatermgmtThreeInitialEvent event,
    Emitter<AddLandandwatermgmtThreeState> emit,
  ) async {
    emit(state.copyWith(
      biogasProductio: false,
      mulchingvalue: false,
      trash: false,
      terracingvalue: false,
      waterHarvesting: false,
      fymCompostManur: false,
      zaiPits: false,
      cutOffDrains: false,
      trashone: false,
      trashtwo: false,
      minimumTillage: false,
      deepRipping: false,
      manuringCompost: false,
      grassStrips: false,
    ));
  }
}
