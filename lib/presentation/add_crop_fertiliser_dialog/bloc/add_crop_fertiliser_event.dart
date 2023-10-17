// ignore_for_file: must_be_immutable

part of 'add_crop_fertiliser_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddCropFertiliserEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtThree widget is first created.
class AddCropFertiliserInitialEvent extends AddCropFertiliserEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddCropFertiliserEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddCropFertiliserEvent {
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

class ChangeCheckbox extends AddCropFertiliserEvent {
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
class ChangeCheckBoxEvent extends AddCropFertiliserEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddCropFertiliserEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddCropFertiliserEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddCropFertiliserEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddCropFertiliserEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddCropFertiliserEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddCropFertiliserEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddCropFertiliserEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddCropFertiliserEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddCropFertiliserEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddCropFertiliserEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox11Event extends AddCropFertiliserEvent {
  ChangeCheckBox11Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox12Event extends AddCropFertiliserEvent {
  ChangeCheckBox12Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox13Event extends AddCropFertiliserEvent {
  ChangeCheckBox13Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
