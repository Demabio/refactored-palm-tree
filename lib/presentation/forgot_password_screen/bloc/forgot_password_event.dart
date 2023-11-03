// ignore_for_file: must_be_immutable

part of 'forgot_password_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///ForgotPassword widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class ForgotPasswordEvent extends Equatable {}

/// Event that is dispatched when the ForgotPassword widget is first created.
class ForgotPasswordInitialEvent extends ForgotPasswordEvent {
  @override
  List<Object?> get props => [];
}

class CreateLoginEvent extends ForgotPasswordEvent {
  CreateLoginEvent({
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
