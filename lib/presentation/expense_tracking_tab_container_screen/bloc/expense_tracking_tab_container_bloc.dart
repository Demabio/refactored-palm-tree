import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/expense_tracking_tab_container_screen/models/expense_tracking_tab_container_model.dart';part 'expense_tracking_tab_container_event.dart';part 'expense_tracking_tab_container_state.dart';/// A bloc that manages the state of a ExpenseTrackingTabContainer according to the event that is dispatched to it.
class ExpenseTrackingTabContainerBloc extends Bloc<ExpenseTrackingTabContainerEvent, ExpenseTrackingTabContainerState> {ExpenseTrackingTabContainerBloc(ExpenseTrackingTabContainerState initialState) : super(initialState) { on<ExpenseTrackingTabContainerInitialEvent>(_onInitialize); }

_onInitialize(ExpenseTrackingTabContainerInitialEvent event, Emitter<ExpenseTrackingTabContainerState> emit, ) async  {  } 
 }
