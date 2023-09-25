import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/livestock_one_page/models/livestock_one_model.dart';
part 'livestock_one_event.dart';
part 'livestock_one_state.dart';

/// A bloc that manages the state of a LivestockOne according to the event that is dispatched to it.
class LivestockOneBloc extends Bloc<LivestockOneEvent, LivestockOneState> {
  LivestockOneBloc(LivestockOneState initialState) : super(initialState) {
    on<LivestockOneInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LivestockOneInitialEvent event,
    Emitter<LivestockOneState> emit,
  ) async {}
}
