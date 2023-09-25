// ignore_for_file: must_be_immutable

part of 'livestock_one_tab_container_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LivestockOneTabContainer widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LivestockOneTabContainerEvent extends Equatable {}

/// Event that is dispatched when the LivestockOneTabContainer widget is first created.
class LivestockOneTabContainerInitialEvent
    extends LivestockOneTabContainerEvent {
  @override
  List<Object?> get props => [];
}
