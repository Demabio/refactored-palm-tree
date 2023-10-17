// ignore_for_file: must_be_immutable

part of 'add_crop_pesticide_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddCropPesticideEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtThree widget is first created.
class AddCropPesticideInitialEvent extends AddCropPesticideEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddCropPesticideEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddCropPesticideEvent {
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

class ChangeCheckbox extends AddCropPesticideEvent {
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
class ChangeCheckBoxEvent extends AddCropPesticideEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddCropPesticideEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddCropPesticideEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddCropPesticideEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddCropPesticideEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddCropPesticideEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddCropPesticideEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddCropPesticideEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddCropPesticideEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddCropPesticideEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddCropPesticideEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox11Event extends AddCropPesticideEvent {
  ChangeCheckBox11Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox12Event extends AddCropPesticideEvent {
  ChangeCheckBox12Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox13Event extends AddCropPesticideEvent {
  ChangeCheckBox13Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
