import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_two_page/models/livestock_two_model.dart';
part 'livestock_two_event.dart';
part 'livestock_two_state.dart';

/// A bloc that manages the state of a LivestockTwo according to the event that is dispatched to it.
class LivestockTwoBloc extends Bloc<LivestockTwoEvent, LivestockTwoState> {
  LivestockTwoBloc(LivestockTwoState initialState) : super(initialState) {
    on<LivestockTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LivestockTwoInitialEvent event,
    Emitter<LivestockTwoState> emit,
  ) async {}
}
