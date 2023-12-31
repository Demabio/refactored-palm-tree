// ignore_for_file: must_be_immutable

part of 'farmers_identification_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmersIdentificationFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmersIdentificationFourEvent extends Equatable {}

/// Event that is dispatched when the FarmersIdentificationFour widget is first created.
class FarmersIdentificationFourInitialEvent
    extends FarmersIdentificationFourEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends FarmersIdentificationFourEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends FarmersIdentificationFourEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends FarmersIdentificationFourEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends FarmersIdentificationFourEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends FarmersIdentificationFourEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends FarmersIdentificationFourEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends FarmersIdentificationFourEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends FarmersIdentificationFourEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class NextTapEvent extends FarmersIdentificationFourEvent {
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

class SaveTapEvent extends FarmersIdentificationFourEvent {
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
