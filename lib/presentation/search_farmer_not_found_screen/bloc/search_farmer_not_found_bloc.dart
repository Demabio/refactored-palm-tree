import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/search_farmer_not_found_screen/models/search_farmer_not_found_model.dart';
part 'search_farmer_not_found_event.dart';
part 'search_farmer_not_found_state.dart';

/// A bloc that manages the state of a SearchFarmerNotFound according to the event that is dispatched to it.
class SearchFarmerNotFoundBloc
    extends Bloc<SearchFarmerNotFoundEvent, SearchFarmerNotFoundState> {
  SearchFarmerNotFoundBloc(SearchFarmerNotFoundState initialState)
      : super(initialState) {
    on<SearchFarmerNotFoundInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SearchFarmerNotFoundInitialEvent event,
    Emitter<SearchFarmerNotFoundState> emit,
  ) async {
    emit(state.copyWith(
      searchController: TextEditingController(),
    ));
  }
}
