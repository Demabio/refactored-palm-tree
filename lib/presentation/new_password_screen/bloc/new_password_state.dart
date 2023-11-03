// ignore_for_file: must_be_immutable

part of 'new_password_bloc.dart';

/// Represents the state of NewPassword in the application.
class NewPasswordState extends Equatable {
  NewPasswordState({
    this.newpasswordController,
    this.confirmpasswordController,
    this.temporaryPassword,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.newPasswordModelObj,
  });

  TextEditingController? newpasswordController;

  TextEditingController? confirmpasswordController;

  TextEditingController? temporaryPassword;

  NewPasswordModel? newPasswordModelObj;

  bool isShowPassword;

  bool isShowPassword1;

  @override
  List<Object?> get props => [
        newpasswordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        newPasswordModelObj,
        temporaryPassword,
      ];
  NewPasswordState copyWith({
    TextEditingController? newpasswordController,
    TextEditingController? confirmpasswordController,
    TextEditingController? temporaryPassword,
    bool? isShowPassword,
    bool? isShowPassword1,
    NewPasswordModel? newPasswordModelObj,
  }) {
    return NewPasswordState(
      temporaryPassword: temporaryPassword ?? this.temporaryPassword,
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      newPasswordModelObj: newPasswordModelObj ?? this.newPasswordModelObj,
    );
  }
}
