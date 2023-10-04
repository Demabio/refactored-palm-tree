import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/farmers_identification_screen_base/models/farmers_identification_model.dart';
import '/core/app_export.dart';
part 'farmers_identification_base_event.dart';
part 'farmers_identification_bloc_state.dart';

/// A bloc that manages the state of a FarmersIdentification according to the event that is dispatched to it.
class FarmersIdentificationBaseBloc extends Bloc<FarmersIdentificationBaseEvent,
    FarmersIdentificationBaseState> {
  FarmersIdentificationBaseBloc(FarmersIdentificationBaseState initialState)
      : super(initialState) {
    on<FarmersIdentificationBaseInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FarmersIdentificationBaseInitialEvent event,
    Emitter<FarmersIdentificationBaseState> emit,
  ) async {}
}
