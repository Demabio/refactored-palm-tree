// ignore_for_file: must_be_immutable

part of 'add_financialandservices_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesTwoEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesTwo widget is first created.
class AddFinancialandservicesTwoInitialEvent
    extends AddFinancialandservicesTwoEvent {
  @override
  List<Object?> get props => [];
}

class GoBackEvent extends AddFinancialandservicesTwoEvent {
  GoBackEvent({
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

class NextTapEvent extends AddFinancialandservicesTwoEvent {
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

class SaveTapEvent extends AddFinancialandservicesTwoEvent {
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

class ClearEvent extends AddFinancialandservicesTwoEvent {
  ClearEvent({
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

class CheckOneEvent extends AddFinancialandservicesTwoEvent {
  CheckOneEvent();

  @override
  List<Object?> get props => [];
}

class CheckTwoEvent extends AddFinancialandservicesTwoEvent {
  CheckTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckThreeEvent extends AddFinancialandservicesTwoEvent {
  CheckThreeEvent();

  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFinancialandservicesTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown5Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown5Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeDropDown6Event extends AddFinancialandservicesTwoEvent {
  ChangeDropDown6Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddFinancialandservicesTwoEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddFinancialandservicesTwoEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddFinancialandservicesTwoEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
