import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_four_dialog/models/add_landandwatermgmt_four_model.dart';
part 'add_landandwatermgmt_four_event.dart';
part 'add_landandwatermgmt_four_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtFour according to the event that is dispatched to it.
class AddLandandwatermgmtFourBloc
    extends Bloc<AddLandandwatermgmtFourEvent, AddLandandwatermgmtFourState> {
  AddLandandwatermgmtFourBloc(AddLandandwatermgmtFourState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtFourInitialEvent>(_onInitialize);
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
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      adjacentWaterBo: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      localityWaterSu: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      manMadeDam: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      waterPan: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      roadRunoff: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox8(
    ChangeCheckBox8Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      rainvalue: event.value,
    ));
  }

  _changeCheckBox9(
    ChangeCheckBox9Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      harvestedWater: event.value,
    ));
  }

  _changeCheckBox10(
    ChangeCheckBox10Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox11(
    ChangeCheckBox11Event event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) {
    emit(state.copyWith(
      waterTrucking: event.value,
    ));
  }

  _onInitialize(
    AddLandandwatermgmtFourInitialEvent event,
    Emitter<AddLandandwatermgmtFourState> emit,
  ) async {
    emit(state.copyWith(
      trash: false,
      adjacentWaterBo: false,
      localityWaterSu: false,
      manMadeDam: false,
      waterPan: false,
      trashone: false,
      roadRunoff: false,
      othervalue: false,
      rainvalue: false,
      harvestedWater: false,
      trashtwo: false,
      waterTrucking: false,
    ));
  }
}
