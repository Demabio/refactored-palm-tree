// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_seven_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtSeven widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtSevenEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtSeven widget is first created.
class AddLandandwatermgmtSevenInitialEvent
    extends AddLandandwatermgmtSevenEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddLandandwatermgmtSevenEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddLandandwatermgmtSevenEvent {
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

class ChangeCheckbox extends AddLandandwatermgmtSevenEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddLandandwatermgmtSevenEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
