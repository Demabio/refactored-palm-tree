// ignore_for_file: must_be_immutable

part of 'login1_bloc.dart';

/// Represents the state of Login1 in the application.
class Login1State extends Equatable {
  Login1State({
    this.userNameController,
    this.passwordController,
    this.isShowPassword = true,
    this.englishName = false,
    this.login1ModelObj,
  });

  TextEditingController? userNameController;

  TextEditingController? passwordController;

  Login1Model? login1ModelObj;

  bool isShowPassword;

  bool englishName;

  @override
  List<Object?> get props => [
        userNameController,
        passwordController,
        isShowPassword,
        englishName,
        login1ModelObj,
      ];
  Login1State copyWith({
    TextEditingController? userNameController,
    TextEditingController? passwordController,
    bool? isShowPassword,
    bool? englishName,
    Login1Model? login1ModelObj,
  }) {
    return Login1State(
      userNameController: userNameController ?? this.userNameController,
      passwordController: passwordController ?? this.passwordController,
      isShowPassword: isShowPassword ?? this.isShowPassword,
      englishName: englishName ?? this.englishName,
      login1ModelObj: login1ModelObj ?? this.login1ModelObj,
    );
  }
}
