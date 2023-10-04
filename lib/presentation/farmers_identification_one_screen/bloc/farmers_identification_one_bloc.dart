import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmers_identification_one_screen/models/farmers_identification_one_model.dart';
part 'farmers_identification_one_event.dart';
part 'farmers_identification_one_state.dart';

/// A bloc that manages the state of a FarmersIdentificationOne according to the event that is dispatched to it.
class FarmersIdentificationOneBloc
    extends Bloc<FarmersIdentificationOneEvent, FarmersIdentificationOneState> {
  FarmersIdentificationOneBloc(FarmersIdentificationOneState initialState)
      : super(initialState) {
    on<FarmersIdentificationOneInitialEvent>(_onInitialize);
    on<StepDownEvent>(_onSteppedDown);
    on<OnSteppedEvent>(_onStepped);
    on<StepUpEvent>(_onSteppedUp);
  }

  _onSteppedDown(
    StepDownEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
          stepped: --state.farmersIdentificationOneModelObj?.stepped,
          page1: state.farmersIdentificationOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onSteppedUp(
    StepUpEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
          stepped: ++state.farmersIdentificationOneModelObj?.stepped,
          page1: state.farmersIdentificationOneModelObj!.stepped > 0
              ? StepState.complete
              : StepState.indexed,
          page2: state.farmersIdentificationOneModelObj!.stepped > 1
              ? StepState.complete
              : StepState.indexed,
          page3: state.farmersIdentificationOneModelObj!.stepped > 2
              ? StepState.complete
              : StepState.indexed,
          page4: state.farmersIdentificationOneModelObj!.stepped > 3
              ? StepState.complete
              : StepState.indexed,
        ),
      ),
    );
  }

  _onStepped(
    OnSteppedEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) {
    emit(
      state.copyWith(
        farmersIdentificationOneModelObj:
            state.farmersIdentificationOneModelObj?.copyWith(
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
    FarmersIdentificationOneInitialEvent event,
    Emitter<FarmersIdentificationOneState> emit,
  ) async {
    emit(state.copyWith(
        nameController: TextEditingController(),
        areaNumberController: TextEditingController(),
        shoppingCenterController: TextEditingController(),
        nameController1: TextEditingController()));
  }
}
