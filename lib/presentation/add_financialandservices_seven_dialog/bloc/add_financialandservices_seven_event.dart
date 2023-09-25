// ignore_for_file: must_be_immutable

part of 'add_financialandservices_seven_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesSeven widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesSevenEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesSeven widget is first created.
class AddFinancialandservicesSevenInitialEvent
    extends AddFinancialandservicesSevenEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends AddFinancialandservicesSevenEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox1Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox1Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox2Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox2Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox3Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox3Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox4Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox4Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox5Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox5Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBox6Event extends AddFinancialandservicesSevenEvent {
  ChangeCheckBox6Event({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
