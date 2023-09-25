import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/add_farm_holding_screen/models/add_farm_holding_model.dart';part 'add_farm_holding_event.dart';part 'add_farm_holding_state.dart';/// A bloc that manages the state of a AddFarmHolding according to the event that is dispatched to it.
class AddFarmHoldingBloc extends Bloc<AddFarmHoldingEvent, AddFarmHoldingState> {AddFarmHoldingBloc(AddFarmHoldingState initialState) : super(initialState) { on<AddFarmHoldingInitialEvent>(_onInitialize); }

_onInitialize(AddFarmHoldingInitialEvent event, Emitter<AddFarmHoldingState> emit, ) async  {  } 
 }
