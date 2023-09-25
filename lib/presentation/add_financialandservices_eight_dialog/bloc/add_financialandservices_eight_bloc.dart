import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_eight_dialog/models/add_financialandservices_eight_model.dart';
part 'add_financialandservices_eight_event.dart';
part 'add_financialandservices_eight_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesEight according to the event that is dispatched to it.
class AddFinancialandservicesEightBloc extends Bloc<
    AddFinancialandservicesEightEvent, AddFinancialandservicesEightState> {
  AddFinancialandservicesEightBloc(
      AddFinancialandservicesEightState initialState)
      : super(initialState) {
    on<AddFinancialandservicesEightInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
    on<ChangeCheckBox5Event>(_changeCheckBox5);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      eExtension: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      faceToFace: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      farmerFieldScho: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      peerToPeer: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesEightInitialEvent event,
    Emitter<AddFinancialandservicesEightState> emit,
  ) async {
    emit(state.copyWith(
      eExtension: false,
      faceToFace: false,
      farmerFieldScho: false,
      trash: false,
      peerToPeer: false,
      othervalue: false,
    ));
  }
}
