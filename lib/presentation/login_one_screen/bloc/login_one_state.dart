// ignore_for_file: must_be_immutable

part of 'login_one_bloc.dart';

/// Represents the state of LoginOne in the application.
class LoginOneState extends Equatable {
  LoginOneState({
    this.emailController,
    this.passwordController,
    this.isShowPassword = true,
    this.loginOneModelObj,
  });

  TextEditingController? emailController;

  TextEditingController? passwordController;

  LoginOneModel? loginOneModelObj;

  bool isShowPassword;

  @override
  List<Object?> get props => [
        emailController,
        passwordController,
        isShowPassword,
        loginOneModelObj,
      ];
  LoginOneState copyWith({
    TextEditingController? emailController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    LoginOneModel? loginOneModelObj,
  }) {
    return LoginOneState(
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      loginOneModelObj: loginOneModelObj ?? this.loginOneModelObj,
    );
  }
}
