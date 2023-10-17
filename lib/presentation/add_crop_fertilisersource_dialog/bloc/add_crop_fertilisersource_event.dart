// ignore_for_file: must_be_immutable

part of 'add_crop_fertilisersource_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddLandandwatermgmtThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddCropFertiliserSourceEvent extends Equatable {}

/// Event that is dispatched when the AddLandandwatermgmtThree widget is first created.
class AddCropFertiliserSourceInitialEvent extends AddCropFertiliserSourceEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddCropFertiliserSourceEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddCropFertiliserSourceEvent {
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

class ChangeCheckbox extends AddCropFertiliserSourceEvent {
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
class ChangeCheckBoxEvent extends AddCropFertiliserSourceEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox11Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox11Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox12Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox12Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox13Event extends AddCropFertiliserSourceEvent {
  ChangeCheckBox13Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
