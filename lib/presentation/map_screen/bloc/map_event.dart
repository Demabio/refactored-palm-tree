// ignore_for_file: must_be_immutable

part of 'map_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Map widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MapEvent extends Equatable {}

/// Event that is dispatched when the Map widget is first created.
class MapInitialEvent extends MapEvent {
  @override
  List<Object?> get props => [];
}
