import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/landandwatermgmt_screen/models/landandwatermgmt_model.dart';part 'landandwatermgmt_event.dart';part 'landandwatermgmt_state.dart';/// A bloc that manages the state of a Landandwatermgmt according to the event that is dispatched to it.
class LandandwatermgmtBloc extends Bloc<LandandwatermgmtEvent, LandandwatermgmtState> {LandandwatermgmtBloc(LandandwatermgmtState initialState) : super(initialState) { on<LandandwatermgmtInitialEvent>(_onInitialize); }

_onInitialize(LandandwatermgmtInitialEvent event, Emitter<LandandwatermgmtState> emit, ) async  {  } 
 }
