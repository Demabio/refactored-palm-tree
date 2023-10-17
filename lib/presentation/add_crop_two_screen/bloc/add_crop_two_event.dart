// ignore_for_file: must_be_immutable

part of 'add_crop_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddCropTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddCropTwoEvent extends Equatable {}

/// Event that is dispatched when the AddCropTwo widget is first created.
class AddCropTwoInitialEvent extends AddCropTwoEvent {
  @override
  List<Object?> get props => [];
}

class CheckOneEvent extends AddCropTwoEvent {
  CheckOneEvent();

  @override
  List<Object?> get props => [];
}

class CheckTwoEvent extends AddCropTwoEvent {
  CheckTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckThreeEvent extends AddCropTwoEvent {
  CheckThreeEvent();

  @override
  List<Object?> get props => [];
}

class NextTapEvent extends AddCropTwoEvent {
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

class SaveTapEvent extends AddCropTwoEvent {
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

///event for dropdown selection
class ChangeDropDownEvent extends AddCropTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddCropTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddCropTwoEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown3Event extends AddCropTwoEvent {
  ChangeDropDown3Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown4Event extends AddCropTwoEvent {
  ChangeDropDown4Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddCropTwoEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddCropTwoEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddCropTwoEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
