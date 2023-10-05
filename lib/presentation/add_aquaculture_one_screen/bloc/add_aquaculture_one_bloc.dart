import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/add_aquaculture_one_screen/models/add_aquaculture_one_model.dart';
part 'add_aquaculture_one_event.dart';
part 'add_aquaculture_one_state.dart';

/// A bloc that manages the state of a AddAquacultureOne according to the event that is dispatched to it.
class AddAquacultureOneBloc
    extends Bloc<AddAquacultureOneEvent, AddAquacultureOneState> {
  AddAquacultureOneBloc(AddAquacultureOneState initialState)
      : super(initialState) {
    on<AddAquacultureOneInitialEvent>(_onInitialize);
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureOneModelObj: state.addAquacultureOneModelObj?.copyWith(
          stepped: --state.addAquacultureOneModelObj?.stepped,
          page1: state.addAquacultureOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addAquacultureOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addAquacultureOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addAquacultureOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureOneModelObj: state.addAquacultureOneModelObj?.copyWith(
          stepped: ++state.addAquacultureOneModelObj?.stepped,
          page1: state.addAquacultureOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.addAquacultureOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.addAquacultureOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.addAquacultureOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) {
    emit(
      state.copyWith(
        addAquacultureOneModelObj: state.addAquacultureOneModelObj?.copyWith(
          stepped: event.value,
          page1: event.value! > 0 ? StepState.complete : StepState.indexed,
          page2: event.value! > 1 ? StepState.complete : StepState.indexed,
          page3: event.value! > 2 ? StepState.complete : StepState.indexed,
          page4: event.value! > 3 ? StepState.complete : StepState.indexed,
        ),
      ),
    );
  }

  _onInitialize(
    AddAquacultureOneInitialEvent event,
    Emitter<AddAquacultureOneState> emit,
  ) async {}
}
