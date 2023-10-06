// ignore_for_file: must_be_immutable

part of 'add_financialandservices_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesThreeEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesThree widget is first created.
class AddFinancialandservicesThreeInitialEvent
    extends AddFinancialandservicesThreeEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddFinancialandservicesThreeEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddFinancialandservicesThreeEvent {
  AddCBs({
    required this.models,
  });

  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

class ChangeCheckbox extends AddFinancialandservicesThreeEvent {
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
class ChangeCheckBoxEvent extends AddFinancialandservicesThreeEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddFinancialandservicesThreeEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
