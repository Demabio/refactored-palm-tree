import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_four_dialog/models/add_farmtechandassets_four_model.dart';
part 'add_farmtechandassets_four_event.dart';
part 'add_farmtechandassets_four_state.dart';

/// A bloc that manages the state of a AddFarmtechandassetsFour according to the event that is dispatched to it.
class AddFarmtechandassetsFourBloc
    extends Bloc<AddFarmtechandassetsFourEvent, AddFarmtechandassetsFourState> {
  AddFarmtechandassetsFourBloc(AddFarmtechandassetsFourState initialState)
      : super(initialState) {
    on<AddFarmtechandassetsFourInitialEvent>(_onInitialize);
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
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      animalDip: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      animalCrush: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      apiaryvalue: event.value,
    ));
  }

  _changeCheckBox3(
    ChangeCheckBox3Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      beeHouse: event.value,
    ));
  }

  _changeCheckBox4(
    ChangeCheckBox4Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      catteBoma: event.value,
    ));
  }

  _changeCheckBox5(
    ChangeCheckBox5Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      feedStore: event.value,
    ));
  }

  _changeCheckBox6(
    ChangeCheckBox6Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      generalStore: event.value,
    ));
  }

  _changeCheckBox7(
    ChangeCheckBox7Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      greenHouse: event.value,
    ));
  }

  _changeCheckBox8(
    ChangeCheckBox8Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      hatcheryvalue: event.value,
    ));
  }

  _changeCheckBox9(
    ChangeCheckBox9Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      hayBailers: event.value,
    ));
  }

  _changeCheckBox10(
    ChangeCheckBox10Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      hayStore: event.value,
    ));
  }

  _changeCheckBox11(
    ChangeCheckBox11Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      loadingRamp: event.value,
    ));
  }

  _changeCheckBox12(
    ChangeCheckBox12Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      milkingParlor: event.value,
    ));
  }

  _changeCheckBox13(
    ChangeCheckBox13Event event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) {
    emit(state.copyWith(
      traditionalGran: event.value,
    ));
  }

  _onInitialize(
    AddFarmtechandassetsFourInitialEvent event,
    Emitter<AddFarmtechandassetsFourState> emit,
  ) async {
    emit(state.copyWith(
      animalDip: false,
      animalCrush: false,
      apiaryvalue: false,
      beeHouse: false,
      catteBoma: false,
      feedStore: false,
      generalStore: false,
      greenHouse: false,
      hatcheryvalue: false,
      hayBailers: false,
      hayStore: false,
      loadingRamp: false,
      milkingParlor: false,
      traditionalGran: false,
    ));
  }
}
