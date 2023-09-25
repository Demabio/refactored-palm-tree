import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_seven_dialog/models/add_financialandservices_seven_model.dart';
part 'add_financialandservices_seven_event.dart';
part 'add_financialandservices_seven_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesSeven according to the event that is dispatched to it.
class AddFinancialandservicesSevenBloc extends Bloc<
    AddFinancialandservicesSevenEvent, AddFinancialandservicesSevenState> {
  AddFinancialandservicesSevenBloc(
      AddFinancialandservicesSevenState initialState)
      : super(initialState) {
    on<AddFinancialandservicesSevenInitialEvent>(_onInitialize);
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
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      nationalGovernm: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      countyGovernmen: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      ngovalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      privatevalue: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      othervalue: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      televisionvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) {
    emit(state.copyWith(
      relativesvalue: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesSevenInitialEvent event,
    Emitter<AddFinancialandservicesSevenState> emit,
  ) async {
    emit(state.copyWith(
      nationalGovernm: false,
      countyGovernmen: false,
      ngovalue: false,
      privatevalue: false,
      othervalue: false,
      televisionvalue: false,
      relativesvalue: false,
    ));
  }
}
