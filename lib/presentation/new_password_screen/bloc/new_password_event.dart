// ignore_for_file: must_be_immutable

part of 'new_password_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///NewPassword widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class NewPasswordEvent extends Equatable {}

/// Event that is dispatched when the NewPassword widget is first created.
class NewPasswordInitialEvent extends NewPasswordEvent {
  @override
  List<Object?> get props => [];
}

class CreateLoginEvent extends NewPasswordEvent {
  CreateLoginEvent({
    this.onCreateLoginEventSuccess,
    this.onCreateLoginEventError,
    this.onFalse,
    this.persmissions,
    this.onServiceUnavailable,
    this.onCreateLoginFailed,
    this.timeout,
    this.noInternet,
  });

  Function? onCreateLoginEventSuccess;
  Function? onFalse;
  Function? persmissions;

  Function? onCreateLoginFailed;
  Function? timeout;

  Function? onCreateLoginEventError;
  Function? onServiceUnavailable;
  Function? noInternet;
  @override
  List<Object?> get props => [
        onCreateLoginEventSuccess,
        onCreateLoginEventError,
        onFalse,
        persmissions,
        onServiceUnavailable,
        onCreateLoginFailed,
        timeout,
        noInternet,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends NewPasswordEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

class ChangePasswordVisibilityEvent2 extends NewPasswordEvent {
  ChangePasswordVisibilityEvent2({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent1 extends NewPasswordEvent {
  ChangePasswordVisibilityEvent1({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
