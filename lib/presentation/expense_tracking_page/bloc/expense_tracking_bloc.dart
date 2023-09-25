import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/expense_tracking_page/models/expense_tracking_model.dart';
part 'expense_tracking_event.dart';
part 'expense_tracking_state.dart';

/// A bloc that manages the state of a ExpenseTracking according to the event that is dispatched to it.
class ExpenseTrackingBloc
    extends Bloc<ExpenseTrackingEvent, ExpenseTrackingState> {
  ExpenseTrackingBloc(ExpenseTrackingState initialState) : super(initialState) {
    on<ExpenseTrackingInitialEvent>(_onInitialize);
  }

  _onInitialize(
    ExpenseTrackingInitialEvent event,
    Emitter<ExpenseTrackingState> emit,
  ) async {}
}
