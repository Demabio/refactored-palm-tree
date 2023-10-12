// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmtechandassetsOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmtechandassetsOneEvent extends Equatable {}

/// Event that is dispatched when the AddFarmtechandassetsOne widget is first created.
class AddFarmtechandassetsOneInitialEvent extends AddFarmtechandassetsOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFarmtechandassetsOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class NextTapEvent extends AddFarmtechandassetsOneEvent {
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

class SaveTapEvent extends AddFarmtechandassetsOneEvent {
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

class ClearEvent extends AddFarmtechandassetsOneEvent {
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

class AddEditOneEvent extends AddFarmtechandassetsOneEvent {
  AddEditOneEvent();

  @override
  List<Object?> get props => [];
}

class AddEditTwoEvent extends AddFarmtechandassetsOneEvent {
  AddEditTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckOneEvent extends AddFarmtechandassetsOneEvent {
  CheckOneEvent();

  @override
  List<Object?> get props => [];
}

class CheckTwoEvent extends AddFarmtechandassetsOneEvent {
  CheckTwoEvent();

  @override
  List<Object?> get props => [];
}

class CheckThreeEvent extends AddFarmtechandassetsOneEvent {
  CheckThreeEvent();

  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddFarmtechandassetsOneEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}
