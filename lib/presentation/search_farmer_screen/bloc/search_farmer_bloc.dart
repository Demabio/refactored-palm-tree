import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/search_farmer_screen/models/search_farmer_model.dart';part 'search_farmer_event.dart';part 'search_farmer_state.dart';/// A bloc that manages the state of a SearchFarmer according to the event that is dispatched to it.
class SearchFarmerBloc extends Bloc<SearchFarmerEvent, SearchFarmerState> {SearchFarmerBloc(SearchFarmerState initialState) : super(initialState) { on<SearchFarmerInitialEvent>(_onInitialize); }

_onInitialize(SearchFarmerInitialEvent event, Emitter<SearchFarmerState> emit, ) async  { emit(state.copyWith(searchController: TextEditingController())); } 
 }
