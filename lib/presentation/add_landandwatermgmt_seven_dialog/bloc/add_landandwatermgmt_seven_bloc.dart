import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_seven_dialog/models/add_landandwatermgmt_seven_model.dart';
part 'add_landandwatermgmt_seven_event.dart';
part 'add_landandwatermgmt_seven_state.dart';

/// A bloc that manages the state of a AddLandandwatermgmtSeven according to the event that is dispatched to it.
class AddLandandwatermgmtSevenBloc
    extends Bloc<AddLandandwatermgmtSevenEvent, AddLandandwatermgmtSevenState> {
  AddLandandwatermgmtSevenBloc(AddLandandwatermgmtSevenState initialState)
      : super(initialState) {
    on<AddLandandwatermgmtSevenInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      countyGovernmen: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      implementingAge: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      selfPrivate: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _onInitialize(
    AddLandandwatermgmtSevenInitialEvent event,
    Emitter<AddLandandwatermgmtSevenState> emit,
  ) async {
    emit(state.copyWith(
      countyGovernmen: false,
      trash: false,
      implementingAge: false,
      othervalue: false,
      selfPrivate: false,
      trashone: false,
    ));
  }
}
