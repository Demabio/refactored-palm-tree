// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtOneEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtOne widget is first created.
class AddLandandwatermgmtOneInitialEvent extends AddLandandwatermgmtOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddLandandwatermgmtOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddLandandwatermgmtOneEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown2Event extends AddLandandwatermgmtOneEvent {
  ChangeDropDown2Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddLandandwatermgmtOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddLandandwatermgmtOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddLandandwatermgmtOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
