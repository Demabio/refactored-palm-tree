// ignore_for_file: must_be_immutable

part of 'login_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginOneEvent extends Equatable {}

/// Event that is dispatched when the LoginOne widget is first created.
class LoginOneInitialEvent extends LoginOneEvent {
  @override
  List<Object?> get props => [];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginOneEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
