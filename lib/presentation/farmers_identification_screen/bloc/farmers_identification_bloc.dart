import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/farmers_identification_screen/models/farmers_identification_model.dart';part 'farmers_identification_event.dart';part 'farmers_identification_state.dart';/// A bloc that manages the state of a FarmersIdentification according to the event that is dispatched to it.
class FarmersIdentificationBloc extends Bloc<FarmersIdentificationEvent, FarmersIdentificationState> {FarmersIdentificationBloc(FarmersIdentificationState initialState) : super(initialState) { on<FarmersIdentificationInitialEvent>(_onInitialize); }

_onInitialize(FarmersIdentificationInitialEvent event, Emitter<FarmersIdentificationState> emit, ) async  {  } 
 }
