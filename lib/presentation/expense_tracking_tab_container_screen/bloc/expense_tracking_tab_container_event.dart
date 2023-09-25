// ignore_for_file: must_be_immutable

part of 'expense_tracking_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ExpenseTrackingTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ExpenseTrackingTabContainerEvent extends Equatable {}

/// Event that is dispatched when the ExpenseTrackingTabContainer widget is first created.
class ExpenseTrackingTabContainerInitialEvent
    extends ExpenseTrackingTabContainerEvent {
  @override
  List<Object?> get props => [];
}
