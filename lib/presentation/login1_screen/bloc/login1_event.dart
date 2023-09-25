// ignore_for_file: must_be_immutable

part of 'login1_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Login1 widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class Login1Event extends Equatable {}

/// Event that is dispatched when the Login1 widget is first created.
class Login1InitialEvent extends Login1Event {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends Login1Event {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends Login1Event {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
