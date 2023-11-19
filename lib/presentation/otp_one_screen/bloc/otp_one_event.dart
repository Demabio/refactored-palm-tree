// ignore_for_file: must_be_immutable

part of 'otp_one_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///OtpOne widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class OtpOneEvent extends Equatable {}

/// Event that is dispatched when the OtpOne widget is first created.
class OtpOneInitialEvent extends OtpOneEvent {
  @override
  List<Object?> get props => [];
}

class OtpDeconstruction extends OtpOneEvent {
  OtpDeconstruction();
  @override
  List<Object?> get props => [];
}

///event for OTP auto fill
class ChangeOTPEvent extends OtpOneEvent {
  ChangeOTPEvent({required this.code});

  String code;

  @override
  List<Object?> get props => [
        code,
      ];
}

class CreateLoginEvent extends OtpOneEvent {
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

class ResendOTPEvent extends OtpOneEvent {
  ResendOTPEvent({
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
