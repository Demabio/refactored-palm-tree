// ignore_for_file: must_be_immutable

part of 'expense_tracking_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ExpenseTracking widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ExpenseTrackingEvent extends Equatable {}

/// Event that is dispatched when the ExpenseTracking widget is first created.
class ExpenseTrackingInitialEvent extends ExpenseTrackingEvent {
  @override
  List<Object?> get props => [];
}
