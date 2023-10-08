// ignore_for_file: must_be_immutable

part of 'farmers_identification_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmersIdentificationOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmersIdentificationOneEvent extends Equatable {}

/// Event that is dispatched when the FarmersIdentificationOne widget is first created.
class FarmersIdentificationOneInitialEvent
    extends FarmersIdentificationOneEvent {
  @override
  List<Object?> get props => [];
}

class StepUpEvent extends FarmersIdentificationOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends FarmersIdentificationOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends FarmersIdentificationOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class NextTapEvent extends FarmersIdentificationOneEvent {
  NextTapEvent({
    this.value,
    this.createFailed,
    this.createSuccessful,
  });

  int? value;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
      ];
}

class SaveTapEvent extends FarmersIdentificationOneEvent {
  SaveTapEvent({
    this.value,
    this.createFailed,
    this.createSuccessful,
  });

  int? value;
  Function? createSuccessful;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
      ];
}
