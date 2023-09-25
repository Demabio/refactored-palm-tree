// ignore_for_file: must_be_immutable

part of 'livestock_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LivestockTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LivestockTwoEvent extends Equatable {}

/// Event that is dispatched when the LivestockTwo widget is first created.
class LivestockTwoInitialEvent extends LivestockTwoEvent {
  @override
  List<Object?> get props => [];
}
