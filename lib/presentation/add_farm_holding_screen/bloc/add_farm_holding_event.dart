// ignore_for_file: must_be_immutable

part of 'add_farm_holding_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmHolding widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmHoldingEvent extends Equatable {}

/// Event that is dispatched when the AddFarmHolding widget is first created.
class AddFarmHoldingInitialEvent extends AddFarmHoldingEvent {
  @override
  List<Object?> get props => [];
}
