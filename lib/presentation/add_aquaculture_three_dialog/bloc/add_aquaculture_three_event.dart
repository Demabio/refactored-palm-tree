// ignore_for_file: must_be_immutable

part of 'add_aquaculture_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureThreeEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureThree widget is first created.
class AddAquacultureThreeInitialEvent extends AddAquacultureThreeEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddAquacultureThreeEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddAquacultureThreeEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddAquacultureThreeEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ResetCBs extends AddAquacultureThreeEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddAquacultureThreeEvent {
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

class ChangeCheckbox extends AddAquacultureThreeEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}
