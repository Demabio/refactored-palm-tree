// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_six_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtSix widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtSixEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtSix widget is first created.
class AddLandandwatermgmtSixInitialEvent extends AddLandandwatermgmtSixEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddLandandwatermgmtSixEvent {
  ChangeDropDownEvent({required this.value, required this.id});

  SelectionPopupModel value;
  int id;

  @override
  List<Object?> get props => [
        value,
        id,
      ];
}

///event for dropdown selection
class ChangeDropDown1Event extends AddLandandwatermgmtSixEvent {
  ChangeDropDown1Event({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddLandandwatermgmtSixEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddLandandwatermgmtSixEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddLandandwatermgmtSixEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangeAgeGroupCheckbox extends AddLandandwatermgmtSixEvent {
  ChangeAgeGroupCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

class ResetCBs extends AddLandandwatermgmtSixEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddLandandwatermgmtSixEvent {
  AddCBs({
    required this.models,
    this.createFailed,
    this.createSuccessful,
  });
  Function? createSuccessful;

  Function? createFailed;
  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
        createFailed,
        createSuccessful,
      ];
}
