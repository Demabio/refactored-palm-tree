// ignore_for_file: must_be_immutable

part of 'add_financialandservices_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddFinancialandservicesOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddFinancialandservicesOneEvent extends Equatable {}

/// Event that is dispatched when the AddFinancialandservicesOne widget is first created.
class AddFinancialandservicesOneInitialEvent
    extends AddFinancialandservicesOneEvent {
  @override
  List<Object?> get props => [];
}

///event for dropdown selection
class ChangeDropDownEvent extends AddFinancialandservicesOneEvent {
  ChangeDropDownEvent({required this.value});

  SelectionPopupModel value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepUpEvent extends AddFinancialandservicesOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddFinancialandservicesOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddFinancialandservicesOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
