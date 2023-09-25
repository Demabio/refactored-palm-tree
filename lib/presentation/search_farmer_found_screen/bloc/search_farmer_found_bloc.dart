import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/search_farmer_found_screen/models/search_farmer_found_model.dart';
part 'search_farmer_found_event.dart';
part 'search_farmer_found_state.dart';

/// A bloc that manages the state of a SearchFarmerFound according to the event that is dispatched to it.
class SearchFarmerFoundBloc
    extends Bloc<SearchFarmerFoundEvent, SearchFarmerFoundState> {
  SearchFarmerFoundBloc(SearchFarmerFoundState initialState)
      : super(initialState) {
    on<SearchFarmerFoundInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SearchFarmerFoundInitialEvent event,
    Emitter<SearchFarmerFoundState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }
}
