import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/financialandservices_screen/models/financialandservices_model.dart';part 'financialandservices_event.dart';part 'financialandservices_state.dart';/// A bloc that manages the state of a Financialandservices according to the event that is dispatched to it.
class FinancialandservicesBloc extends Bloc<FinancialandservicesEvent, FinancialandservicesState> {FinancialandservicesBloc(FinancialandservicesState initialState) : super(initialState) { on<FinancialandservicesInitialEvent>(_onInitialize); }

_onInitialize(FinancialandservicesInitialEvent event, Emitter<FinancialandservicesState> emit, ) async  {  } 
 }
