// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrimaryFarmHolding widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PrimaryFarmHoldingEvent extends Equatable {}

/// Event that is dispatched when the PrimaryFarmHolding widget is first created.
class PrimaryFarmHoldingInitialEvent extends PrimaryFarmHoldingEvent {
  @override
  List<Object?> get props => [];
}
