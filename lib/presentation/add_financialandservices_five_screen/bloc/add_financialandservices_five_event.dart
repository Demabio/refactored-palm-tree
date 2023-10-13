// ignore_for_file: must_be_immutable

part of 'add_financialandservices_five_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesFive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesFiveEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesFive widget is first created.
class AddFinancialandservicesFiveInitialEvent
    extends AddFinancialandservicesFiveEvent {
  @override
  List<Object?> get props => [];
}

class ResetCBs extends AddFinancialandservicesFiveEvent {
  ResetCBs();

  @override
  List<Object?> get props => [];
}

class AddCBs extends AddFinancialandservicesFiveEvent {
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

class ChangeCheckbox extends AddFinancialandservicesFiveEvent {
  ChangeCheckbox({required this.value, this.selected});

  int value;

  bool? selected;

  @override
  List<Object?> get props => [
        value,
        selected,
      ];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFinancialandservicesFiveEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddFinancialandservicesFiveEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox7Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox7Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox8Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox8Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox9Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox9Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox10Event extends AddFinancialandservicesFiveEvent {
  ChangeCheckBox10Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
