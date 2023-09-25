import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_five_dialog/models/add_landandwatermgmt_five_model.dart';
part 'add_landandwatermgmt_five_event.dart';
part 'add_landandwatermgmt_five_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtFive according to the event that is dispatched to it.
class AddLandandwatermgmtFiveBloc
    extends Bloc<AddLandandwatermgmtFiveEvent, AddLandandwatermgmtFiveState> {
  AddLandandwatermgmtFiveBloc(AddLandandwatermgmtFiveState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtFiveInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
    on<ChangeCheckBox6Event>(_changeCheckBox6);
    on<ChangeCheckBox7Event>(_changeCheckBox7);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      furrowvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      dripvalue: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      sprinklervalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      centrePivot: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      bucketIrrigatio: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      basinIrrigation: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      floodingvalue: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) {
    emit(state.copyWith(
      furrowCanal: event.value,
    ));
  }

  _onInitialize(
    AddLandandwatermgmtFiveInitialEvent event,
    Emitter<AddLandandwatermgmtFiveState> emit,
  ) async {
    emit(state.copyWith(
      furrowvalue: false,
      dripvalue: false,
      sprinklervalue: false,
      centrePivot: false,
      bucketIrrigatio: false,
      basinIrrigation: false,
      floodingvalue: false,
      furrowCanal: false,
    ));
  }
}
