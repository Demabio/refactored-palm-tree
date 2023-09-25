import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_six_dialog/models/add_financialandservices_six_model.dart';
part 'add_financialandservices_six_event.dart';
part 'add_financialandservices_six_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSix according to the event that is dispatched to it.
class AddFinancialandservicesSixBloc extends Bloc<
    AddFinancialandservicesSixEvent, AddFinancialandservicesSixState> {
  AddFinancialandservicesSixBloc(AddFinancialandservicesSixState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSixInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
    on<ChangeCheckBox3Event>(_changeCheckBox3);
    on<ChangeCheckBox4Event>(_changeCheckBox4);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      publicGathering: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      radiovalue: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      internetvalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) {
    emit(state.copyWith(
      extensionMeetin: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesSixInitialEvent event,
    Emitter<AddFinancialandservicesSixState> emit,
  ) async {
    emit(state.copyWith(
      publicGathering: false,
      radiovalue: false,
      trash: false,
      internetvalue: false,
      extensionMeetin: false,
    ));
  }
}
