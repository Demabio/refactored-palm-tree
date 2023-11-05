// ignore_for_file: must_be_immutable

part of 'new_password_bloc.dart';

/// Represents the state of NewPassword in the application.
class NewPasswordState extends Equatable {
  NewPasswordState({
    this.username,
    this.newpasswordController,
    this.confirmpasswordController,
    this.temporaryPassword,
    this.isShowPassword = true,
    this.isShowPassword1 = true,
    this.isShowPassword2 = true,
    this.newPasswordModelObj,
  });
  TextEditingController? username;

  TextEditingController? newpasswordController;

  TextEditingController? confirmpasswordController;

  TextEditingController? temporaryPassword;

  NewPasswordModel? newPasswordModelObj;

  bool isShowPassword;

  bool isShowPassword1;
  bool isShowPassword2;

  @override
  List<Object?> get props => [
        username,
        newpasswordController,
        confirmpasswordController,
        isShowPassword,
        isShowPassword1,
        isShowPassword2,
        newPasswordModelObj,
        temporaryPassword,
      ];
  NewPasswordState copyWith({
    TextEditingController? username,
    TextEditingController? newpasswordController,
    TextEditingController? confirmpasswordController,
    TextEditingController? temporaryPassword,
    bool? isShowPassword,
    bool? isShowPassword1,
    bool? isShowPassword2,
    NewPasswordModel? newPasswordModelObj,
  }) {
    return NewPasswordState(
      temporaryPassword: temporaryPassword ?? this.temporaryPassword,
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      confirmpasswordController:
          confirmpasswordController ?? this.confirmpasswordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      isShowPassword2: isShowPassword2 ?? this.isShowPassword2,
      isShowPassword1: isShowPassword1 ?? this.isShowPassword1,
      newPasswordModelObj: newPasswordModelObj ?? this.newPasswordModelObj,
      username: username ?? this.username,
    );
  }
}
