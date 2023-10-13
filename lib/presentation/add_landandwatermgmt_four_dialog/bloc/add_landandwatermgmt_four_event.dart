// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtFourEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtFour widget is first created.
class AddLandandwatermgmtFourInitialEvent extends AddLandandwatermgmtFourEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddLandandwatermgmtFourEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddLandandwatermgmtFourEvent {
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

class ChangeCheckbox extends AddLandandwatermgmtFourEvent {
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
class ChangeCheckBoxEvent extends AddLandandwatermgmtFourEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox11Event extends AddLandandwatermgmtFourEvent {
  ChangeCheckBox11Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
