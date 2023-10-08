// ignore_for_file: must_be_immutable

part of 'farmer_registration_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///FarmerRegistration widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class FarmerRegistrationEvent extends Equatable {}

/// Event that is dispatched when the FarmerRegistration widget is first created.
class FarmerRegistrationInitialEvent extends FarmerRegistrationEvent {
  @override
  List<Object?> get props => [];
}

class StepUpEvent extends FarmerRegistrationEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends FarmerRegistrationEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends FarmerRegistrationEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
