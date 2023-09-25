import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/aquaculture_screen/models/aquaculture_model.dart';part 'aquaculture_event.dart';part 'aquaculture_state.dart';/// A bloc that manages the state of a Aquaculture according to the event that is dispatched to it.
class AquacultureBloc extends Bloc<AquacultureEvent, AquacultureState> {AquacultureBloc(AquacultureState initialState) : super(initialState) { on<AquacultureInitialEvent>(_onInitialize); }

_onInitialize(AquacultureInitialEvent event, Emitter<AquacultureState> emit, ) async  {  } 
 }
