// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Login widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginEvent extends Equatable {}

/// Event that is dispatched when the Login widget is first created.
class LoginInitialEvent extends LoginEvent {
  LoginInitialEvent({
    this.onTrue,
    this.onFalse,
    this.onError,
  });

  Function? onTrue;

  Function? onFalse;

  Function? onError;

  @override
  List<Object?> get props => [
        onTrue,
        onFalse,
        onError,
      ];
}

///Event that is dispatched when the user calls the https://kiamistrainapi.kalro.org/gateway/UserService/login API.
class CreateLoginEvent extends LoginEvent {
  CreateLoginEvent({
    this.onCreateLoginEventSuccess,
    this.onCreateLoginEventError,
    this.onFalse,
    this.persmissions,
    this.onCreateLoginFailed,
    this.timeout,
    this.onServiceUnavailable,
  });

  Function? onCreateLoginEventSuccess;
  Function? onFalse;
  Function? persmissions;

  Function? onCreateLoginFailed;
  Function? timeout;

  Function? onCreateLoginEventError;
  Function? onServiceUnavailable;

  @override
  List<Object?> get props => [
        onCreateLoginEventSuccess,
        onCreateLoginEventError,
        onFalse,
        persmissions,
        onCreateLoginFailed,
        timeout,
        onServiceUnavailable,
      ];
}

class SendOTPEvent extends LoginEvent {
  SendOTPEvent({
    this.onCreateLoginEventSuccess,
    this.onCreateLoginEventError,
    this.onFalse,
    this.persmissions,
  });

  Function? onCreateLoginEventSuccess;
  Function? onFalse;
  Function? persmissions;

  Function? onCreateLoginEventError;

  @override
  List<Object?> get props => [
        onCreateLoginEventSuccess,
        onCreateLoginEventError,
        onFalse,
        persmissions,
      ];
}

class VersionCheckEvent extends LoginEvent {
  VersionCheckEvent({
    this.onTrue,
    this.onFalse,
    this.onError,
  });

  Function? onTrue;

  Function? onFalse;

  Function? onError;

  @override
  List<Object?> get props => [
        onTrue,
        onFalse,
        onError,
      ];
}

///Event for changing password visibility
class ChangePasswordVisibilityEvent extends LoginEvent {
  ChangePasswordVisibilityEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}

///Event for changing checkbox
class ChangeCheckBoxEvent extends LoginEvent {
  ChangeCheckBoxEvent({required this.value});

  bool value;

  @override
  List<Object?> get props => [
        value,
      ];
}
