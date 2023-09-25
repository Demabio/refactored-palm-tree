import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/home_farmer_found_dialog/models/home_farmer_found_model.dart';
part 'home_farmer_found_event.dart';
part 'home_farmer_found_state.dart';

/// A bloc that manages the state of a HomeFarmerFound according to the event that is dispatched to it.
class HomeFarmerFoundBloc
    extends Bloc<HomeFarmerFoundEvent, HomeFarmerFoundState> {
  HomeFarmerFoundBloc(HomeFarmerFoundState initialState) : super(initialState) {
    on<HomeFarmerFoundInitialEvent>(_onInitialize);
  }

  _onInitialize(
    HomeFarmerFoundInitialEvent event,
    Emitter<HomeFarmerFoundState> emit,
  ) async {}
}
