import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_six_dialog/models/add_aquaculture_six_model.dart';
part 'add_aquaculture_six_event.dart';
part 'add_aquaculture_six_state.dart';

/// A bloc that manages the state of a AddAquacultureSix according to the event that is dispatched to it.
class AddAquacultureSixBloc
    extends Bloc<AddAquacultureSixEvent, AddAquacultureSixState> {
  AddAquacultureSixBloc(AddAquacultureSixState initialState)
      : super(initialState) {
    on<AddAquacultureSixInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureSixState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  _onInitialize(
    AddAquacultureSixInitialEvent event,
    Emitter<AddAquacultureSixState> emit,
  ) async {
    emit(state.copyWith(
      brackishvalue: false,
      chickMarsh: false,
      homeMadeFeedMix: false,
    ));
  }
}
