// ignore_for_file: must_be_immutable

part of 'add_aquaculture_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AddAquacultureOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AddAquacultureOneEvent extends Equatable {}

/// Event that is dispatched when the AddAquacultureOne widget is first created.
class AddAquacultureOneInitialEvent extends AddAquacultureOneEvent {
  @override
  List<Object?> get props => [];
}

class StepUpEvent extends AddAquacultureOneEvent {
  StepUpEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class StepDownEvent extends AddAquacultureOneEvent {
  StepDownEvent({this.value});

  String? value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class OnSteppedEvent extends AddAquacultureOneEvent {
  OnSteppedEvent({this.value});

  int? value;

  @override
  List<Object?> get props => [
        value,
      ];
}
