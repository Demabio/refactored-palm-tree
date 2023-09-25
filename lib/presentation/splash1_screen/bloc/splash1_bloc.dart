import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/splash1_screen/models/splash1_model.dart';
part 'splash1_event.dart';
part 'splash1_state.dart';

/// A bloc that manages the state of a Splash1 according to the event that is dispatched to it.
class Splash1Bloc extends Bloc<Splash1Event, Splash1State> {
  Splash1Bloc(Splash1State initialState) : super(initialState) {
    on<Splash1InitialEvent>(_onInitialize);
  }

  _onInitialize(
    Splash1InitialEvent event,
    Emitter<Splash1State> emit,
  ) async {}
}
