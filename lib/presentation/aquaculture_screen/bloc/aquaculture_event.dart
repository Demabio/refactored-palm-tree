// ignore_for_file: must_be_immutable

part of 'aquaculture_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Aquaculture widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AquacultureEvent extends Equatable {}

/// Event that is dispatched when the Aquaculture widget is first created.
class AquacultureInitialEvent extends AquacultureEvent {
  @override
  List<Object?> get props => [];
}
