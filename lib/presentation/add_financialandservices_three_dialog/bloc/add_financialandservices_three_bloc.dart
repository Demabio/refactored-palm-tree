import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_financialandservices_three_dialog/models/add_financialandservices_three_model.dart';
part 'add_financialandservices_three_event.dart';
part 'add_financialandservices_three_state.dart';

/// A bloc that manages the state of a AddFinancialandservicesThree according to the event that is dispatched to it.
class AddFinancialandservicesThreeBloc extends Bloc<
    AddFinancialandservicesThreeEvent, AddFinancialandservicesThreeState> {
  AddFinancialandservicesThreeBloc(
      AddFinancialandservicesThreeState initialState)
      : super(initialState) {
    on<AddFinancialandservicesThreeInitialEvent>(_onInitialize);
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
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trash: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      nonFarmTrading: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trashone: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      trashtwo: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      remittancesvalu: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      pensionvalue: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      otherIncomeSour: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) {
    emit(state.copyWith(
      cashTransfer: event.value,
    ));
  }

  _onInitialize(
    AddFinancialandservicesThreeInitialEvent event,
    Emitter<AddFinancialandservicesThreeState> emit,
  ) async {
    emit(state.copyWith(
      trash: false,
      nonFarmTrading: false,
      trashone: false,
      trashtwo: false,
      remittancesvalu: false,
      pensionvalue: false,
      otherIncomeSour: false,
      cashTransfer: false,
    ));
  }
}
