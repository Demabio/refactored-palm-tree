// ignore_for_file: must_be_immutable

part of 'add_aquaculture_six_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureSix widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureSixEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureSix widget is first created.
class AddAquacultureSixInitialEvent extends AddAquacultureSixEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddAquacultureSixEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddAquacultureSixEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddAquacultureSixEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ResetCBs extends AddAquacultureSixEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddAquacultureSixEvent {
  AddCBs({
    required this.models,
  });

  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

class ChangeCheckbox extends AddAquacultureSixEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}
