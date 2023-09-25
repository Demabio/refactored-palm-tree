import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/livestock_one_tab_container_screen/models/livestock_one_tab_container_model.dart';part 'livestock_one_tab_container_event.dart';part 'livestock_one_tab_container_state.dart';/// A bloc that manages the state of a LivestockOneTabContainer according to the event that is dispatched to it.
class LivestockOneTabContainerBloc extends Bloc<LivestockOneTabContainerEvent, LivestockOneTabContainerState> {LivestockOneTabContainerBloc(LivestockOneTabContainerState initialState) : super(initialState) { on<LivestockOneTabContainerInitialEvent>(_onInitialize); }

_onInitialize(LivestockOneTabContainerInitialEvent event, Emitter<LivestockOneTabContainerState> emit, ) async  {  } 
 }
