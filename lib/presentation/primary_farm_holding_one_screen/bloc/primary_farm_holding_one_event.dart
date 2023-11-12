// ignore_for_file: must_be_immutable

part of 'primary_farm_holding_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///PrimaryFarmHoldingOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class PrimaryFarmHoldingOneEvent extends Equatable {}

/// Event that is dispatched when the PrimaryFarmHoldingOne widget is first created.
class PrimaryFarmHoldingOneInitialEvent extends PrimaryFarmHoldingOneEvent {
  @override
  List<Object?> get props => [];
}

class NextTapEvent extends PrimaryFarmHoldingOneEvent {
  NextTapEvent({
    this.value,
    this.createFailed,
    this.createSuccessful,
    this.validation,
  });

  int? value;
  Function? createSuccessful;
  Function? validation;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        validation,
      ];
}

class SaveTapEvent extends PrimaryFarmHoldingOneEvent {
  SaveTapEvent({
    this.value,
    this.createFailed,
    this.createSuccessful,
    this.validation,
  });

  int? value;
  Function? createSuccessful;
  Function? validation;

  Function? createFailed;
  @override
  List<Object?> get props => [
        value,
        createFailed,
        createSuccessful,
        validation,
      ];
}

class ChangeDropDown2Event extends PrimaryFarmHoldingOneEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends PrimaryFarmHoldingOneEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends PrimaryFarmHoldingOneEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends PrimaryFarmHoldingOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends PrimaryFarmHoldingOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends PrimaryFarmHoldingOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends PrimaryFarmHoldingOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
