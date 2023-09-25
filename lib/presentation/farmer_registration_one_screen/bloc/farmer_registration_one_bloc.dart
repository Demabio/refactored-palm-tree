import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/farmer_registration_one_screen/models/farmer_registration_one_model.dart';
part 'farmer_registration_one_event.dart';
part 'farmer_registration_one_state.dart';

/// A bloc that manages the state of a FarmerRegistrationOne according to the event that is dispatched to it.
class FarmerRegistrationOneBloc
    extends Bloc<FarmerRegistrationOneEvent, FarmerRegistrationOneState> {
  FarmerRegistrationOneBloc(FarmerRegistrationOneState initialState)
      : super(initialState) {
    on<FarmerRegistrationOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    FarmerRegistrationOneInitialEvent event,
    Emitter<FarmerRegistrationOneState> emit,
  ) async {}
}
