// ignore_for_file: must_be_immutable

part of 'farmtechandassets_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Farmtechandassets widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmtechandassetsEvent extends Equatable {}

/// Event that is dispatched when the Farmtechandassets widget is first created.
class FarmtechandassetsInitialEvent extends FarmtechandassetsEvent {
  @override
  List<Object?> get props => [];
}
