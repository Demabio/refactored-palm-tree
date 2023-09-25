import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/farmer_registration_screen/models/farmer_registration_model.dart';part 'farmer_registration_event.dart';part 'farmer_registration_state.dart';/// A bloc that manages the state of a FarmerRegistration according to the event that is dispatched to it.
class FarmerRegistrationBloc extends Bloc<FarmerRegistrationEvent, FarmerRegistrationState> {FarmerRegistrationBloc(FarmerRegistrationState initialState) : super(initialState) { on<FarmerRegistrationInitialEvent>(_onInitialize); }

_onInitialize(FarmerRegistrationInitialEvent event, Emitter<FarmerRegistrationState> emit, ) async  {  } 
 }
