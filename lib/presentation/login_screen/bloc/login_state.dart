// ignore_for_file: must_be_immutable

part of 'login_bloc.dart';

/// Represents the state of Login in the application.
class LoginState extends Equatable {
  LoginState({
    this.userNameController,
    this.passwordController,
    this.isShowPassword = true,
    this.englishName = false,
    this.loginModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  bool isShowPassword;

  bool englishName;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        isShowPassword,
        englishName,
        loginModelObj,
      ];
  LoginState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? englishName,
    LoginModel? loginModelObj,
  }) {
    return LoginState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      englishName: englishName ?? this.englishName,
      loginModelObj: loginModelObj ?? this.loginModelObj,
    );
  }
}
