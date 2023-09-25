import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/primary_farm_holding_screen/models/primary_farm_holding_model.dart';part 'primary_farm_holding_event.dart';part 'primary_farm_holding_state.dart';/// A bloc that manages the state of a PrimaryFarmHolding according to the event that is dispatched to it.
class PrimaryFarmHoldingBloc extends Bloc<PrimaryFarmHoldingEvent, PrimaryFarmHoldingState> {PrimaryFarmHoldingBloc(PrimaryFarmHoldingState initialState) : super(initialState) { on<PrimaryFarmHoldingInitialEvent>(_onInitialize); }

_onInitialize(PrimaryFarmHoldingInitialEvent event, Emitter<PrimaryFarmHoldingState> emit, ) async  {  } 
 }
