// ignore_for_file: must_be_immutable

part of 'farmers_identification_base_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmersIdentification widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmersIdentificationBaseEvent extends Equatable {}

/// Event that is dispatched when the FarmersIdentification widget is first created.
class FarmersIdentificationBaseInitialEvent
    extends FarmersIdentificationBaseEvent {
  @override
  List<Object?> get props => [];
}
