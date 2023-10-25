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
    this.linebarvalue = 0,
    this.percentagedone = 0,
    this.success = false,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  LoginModel? loginModelObj;

  bool isShowPassword;

  bool englishName;
  double linebarvalue;

  bool success;

  int percentagedone;
  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        isShowPassword,
        englishName,
        loginModelObj,
        percentagedone,
        linebarvalue,
        success,
      ];
  LoginState copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? englishName,
    LoginModel? loginModelObj,
    double? linebarvalue,
    int? percentagedone,
    bool? success,
  }) {
    return LoginState(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      englishName: englishName ?? this.englishName,
      loginModelObj: loginModelObj ?? this.loginModelObj,
      linebarvalue: linebarvalue ?? this.linebarvalue,
      percentagedone: percentagedone ?? this.percentagedone,
      success: success ?? this.success,
    );
  }
}
