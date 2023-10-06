// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtTwoEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtTwo widget is first created.
class AddLandandwatermgmtTwoInitialEvent extends AddLandandwatermgmtTwoEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddLandandwatermgmtTwoEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddLandandwatermgmtTwoEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddLandandwatermgmtTwoEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddLandandwatermgmtTwoEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddLandandwatermgmtTwoEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
