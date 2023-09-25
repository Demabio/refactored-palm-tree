import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_three_dialog/models/add_aquaculture_three_model.dart';
part 'add_aquaculture_three_event.dart';
part 'add_aquaculture_three_state.dart';

/// A bloc that manages the state of a AddAquacultureThree according to the event that is dispatched to it.
class AddAquacultureThreeBloc
    extends Bloc<AddAquacultureThreeEvent, AddAquacultureThreeState> {
  AddAquacultureThreeBloc(AddAquacultureThreeState initialState)
      : super(initialState) {
    on<AddAquacultureThreeInitialEvent>(_onInitialize);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<ChangeCheckBox1Event>(_changeCheckBox1);
    on<ChangeCheckBox2Event>(_changeCheckBox2);
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      brackishvalue: event.value,
    ));
  }

  _changeCheckBox1(
    ChangeCheckBox1Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      chickMarsh: event.value,
    ));
  }

  _changeCheckBox2(
    ChangeCheckBox2Event event,
    Emitter<AddAquacultureThreeState> emit,
  ) {
    emit(state.copyWith(
      homeMadeFeedMix: event.value,
    ));
  }

  _onInitialize(
    AddAquacultureThreeInitialEvent event,
    Emitter<AddAquacultureThreeState> emit,
  ) async {
    emit(state.copyWith(
      brackishvalue: false,
      chickMarsh: false,
      homeMadeFeedMix: false,
    ));
  }
}
