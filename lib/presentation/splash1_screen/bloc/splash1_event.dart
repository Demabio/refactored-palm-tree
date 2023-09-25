// ignore_for_file: must_be_immutable

part of 'splash1_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Splash1 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Splash1Event extends Equatable {}

/// Event that is dispatched when the Splash1 widget is first created.
class Splash1InitialEvent extends Splash1Event {
  @override
  List<Object?> get props => [];
}
