// ignore_for_file: must_be_immutable

part of 'farmers_identification_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmersIdentification widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmersIdentificationEvent extends Equatable {}

/// Event that is dispatched when the FarmersIdentification widget is first created.
class FarmersIdentificationInitialEvent extends FarmersIdentificationEvent {
  @override
  List<Object?> get props => [];
}
