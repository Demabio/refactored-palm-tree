// ignore_for_file: must_be_immutable

part of 'forgot_password_bloc.dart';

/// Represents the state of ForgotPassword in the application.
class ForgotPasswordState extends Equatable {
  ForgotPasswordState({
    this.userNameController,
    this.forgotPasswordModelObj,
  });

  TextEditingController? userNameController;

  ForgotPasswordModel? forgotPasswordModelObj;

  @override
  List<Object?> get props => [
        userNameController,
        forgotPasswordModelObj,
      ];
  ForgotPasswordState copyWith({
    TextEditingController? userNameController,
    ForgotPasswordModel? forgotPasswordModelObj,
  }) {
    return ForgotPasswordState(
      userNameController: userNameController ?? this.userNameController,
      forgotPasswordModelObj:
          forgotPasswordModelObj ?? this.forgotPasswordModelObj,
    );
  }
}
