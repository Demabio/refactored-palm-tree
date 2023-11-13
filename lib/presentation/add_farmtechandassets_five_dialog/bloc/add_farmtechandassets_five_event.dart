// ignore_for_file: must_be_immutable

part of 'add_farmtechandassets_five_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFarmtechandassetsFive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFarmtechandassetsFiveEvent extends Equatable {}

/// Event that is dispatched when the AddFarmtechandassetsFive widget is first created.
class AddFarmtechandassetsFiveInitialEvent
    extends AddFarmtechandassetsFiveEvent {
  @override
  List<Object?> get props => [];
}

class AddCBs extends AddFarmtechandassetsFiveEvent {
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

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddFarmtechandassetsFiveEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ResetCBs extends AddFarmtechandassetsFiveEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class ChangeCheckbox extends AddFarmtechandassetsFiveEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}
