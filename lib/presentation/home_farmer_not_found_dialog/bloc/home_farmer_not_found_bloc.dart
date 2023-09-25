import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/home_farmer_not_found_dialog/models/home_farmer_not_found_model.dart';
part 'home_farmer_not_found_event.dart';
part 'home_farmer_not_found_state.dart';

/// A bloc that manages the state of a HomeFarmerNotFound according to the event that is dispatched to it.
class HomeFarmerNotFoundBloc
    extends Bloc<HomeFarmerNotFoundEvent, HomeFarmerNotFoundState> {
  HomeFarmerNotFoundBloc(HomeFarmerNotFoundState initialState)
      : super(initialState) {
    on<HomeFarmerNotFoundInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeFarmerNotFoundInitialEvent event,
    Emitter<HomeFarmerNotFoundState> emit,
  ) async {}
}
