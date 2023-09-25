import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_dialog_two_dialog/models/add_reared_livestock_dialog_two_model.dart';
part 'add_reared_livestock_dialog_two_event.dart';
part 'add_reared_livestock_dialog_two_state.dart';

/// A bloc that manages the state of a AddRearedLivestockDialogTwo according to the event that is dispatched to it.
class AddRearedLivestockDialogTwoBloc extends Bloc<
    AddRearedLivestockDialogTwoEvent, AddRearedLivestockDialogTwoState> {
  AddRearedLivestockDialogTwoBloc(AddRearedLivestockDialogTwoState initialState)
      : super(initialState) {
    on<AddRearedLivestockDialogTwoInitialEvent>(_onInitialize);
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
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      lessThanThreeWe: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      threeToEightWee: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      lessThanTwoMont: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      twoToSixMonths: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      sixToTwelveMont: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      oneToTwoYears: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      twoToFourYears: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) {
    emit(state.copyWith(
      fourYearsOrOlde: event.value,
    ));
  }

  _onInitialize(
    AddRearedLivestockDialogTwoInitialEvent event,
    Emitter<AddRearedLivestockDialogTwoState> emit,
  ) async {
    emit(state.copyWith(
      lessThanThreeWe: false,
      threeToEightWee: false,
      lessThanTwoMont: false,
      twoToSixMonths: false,
      sixToTwelveMont: false,
      oneToTwoYears: false,
      twoToFourYears: false,
      fourYearsOrOlde: false,
    ));
  }
}
