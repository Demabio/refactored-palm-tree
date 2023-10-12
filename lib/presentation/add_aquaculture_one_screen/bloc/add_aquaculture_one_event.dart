// ignore_for_file: must_be_immutable

part of 'add_aquaculture_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureOneEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureOne widget is first created.
class AddAquacultureOneInitialEvent extends AddAquacultureOneEvent {
  @override
  List<Object?> get props => [];
}

class NextTapEvent extends AddAquacultureOneEvent {
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

class SaveTapEvent extends AddAquacultureOneEvent {
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

class ClearEvent extends AddAquacultureOneEvent {
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

class AddEditOneEvent extends AddAquacultureOneEvent {
  AddEditOneEvent();

  @override
  List<Object?> get props => [];
}

class AddEditTwoEvent extends AddAquacultureOneEvent {
  AddEditTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckOneEvent extends AddAquacultureOneEvent {
  CheckOneEvent();

  @override
  List<Object?> get props => [];
}

class CheckTwoEvent extends AddAquacultureOneEvent {
  CheckTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckThreeEvent extends AddAquacultureOneEvent {
  CheckThreeEvent();

  @override
  List<Object?> get props => [];
}

class StepUpEvent extends AddAquacultureOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddAquacultureOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddAquacultureOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
