// ignore_for_file: must_be_immutable

part of 'add_landandwatermgmt_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddLandandwatermgmtThreeEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtThree widget is first created.
class AddLandandwatermgmtThreeInitialEvent
    extends AddLandandwatermgmtThreeEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddLandandwatermgmtThreeEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddLandandwatermgmtThreeEvent {
  AddCBs({
    required this.models,
  });

  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

class ChangeCheckbox extends AddLandandwatermgmtThreeEvent {
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
class ChangeCheckBoxEvent extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox11Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox11Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox12Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox12Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox13Event extends AddLandandwatermgmtThreeEvent {
  ChangeCheckBox13Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
