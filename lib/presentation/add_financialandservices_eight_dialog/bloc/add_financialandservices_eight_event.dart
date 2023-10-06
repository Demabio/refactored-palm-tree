// ignore_for_file: must_be_immutable

part of 'add_financialandservices_eight_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesEight widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesEightEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesEight widget is first created.
class AddFinancialandservicesEightInitialEvent
    extends AddFinancialandservicesEightEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddFinancialandservicesEightEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddFinancialandservicesEightEvent {
  AddCBs({
    required this.models,
  });

  List<CheckBoxList> models;
  @override
  List<Object?> get props => [
        models,
      ];
}

class ChangeCheckbox extends AddFinancialandservicesEightEvent {
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
class ChangeCheckBoxEvent extends AddFinancialandservicesEightEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFinancialandservicesEightEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFinancialandservicesEightEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFinancialandservicesEightEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFinancialandservicesEightEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFinancialandservicesEightEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
