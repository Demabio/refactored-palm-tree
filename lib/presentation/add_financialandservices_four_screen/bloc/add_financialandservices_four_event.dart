// ignore_for_file: must_be_immutable

part of 'add_financialandservices_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesFourEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesFour widget is first created.
class AddFinancialandservicesFourInitialEvent
    extends AddFinancialandservicesFourEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFinancialandservicesFourEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddFinancialandservicesFourEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFinancialandservicesFourEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFinancialandservicesFourEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFinancialandservicesFourEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFinancialandservicesFourEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFinancialandservicesFourEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
