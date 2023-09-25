import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/farmtechandassets_screen/models/farmtechandassets_model.dart';part 'farmtechandassets_event.dart';part 'farmtechandassets_state.dart';/// A bloc that manages the state of a Farmtechandassets according to the event that is dispatched to it.
class FarmtechandassetsBloc extends Bloc<FarmtechandassetsEvent, FarmtechandassetsState> {FarmtechandassetsBloc(FarmtechandassetsState initialState) : super(initialState) { on<FarmtechandassetsInitialEvent>(_onInitialize); }

_onInitialize(FarmtechandassetsInitialEvent event, Emitter<FarmtechandassetsState> emit, ) async  {  } 
 }
