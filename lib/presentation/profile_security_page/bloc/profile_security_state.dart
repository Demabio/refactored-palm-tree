// ignore_for_file: must_be_immutable

part of 'profile_security_bloc.dart';

/// Represents the state of ProfileSecurity in the application.
class ProfileSecurityState extends Equatable {
  ProfileSecurityState({
    this.passwordController,
    this.newpasswordController,
    this.profileSecurityModelObj,
  });

  TextEditingController? passwordController;

  TextEditingController? newpasswordController;

  ProfileSecurityModel? profileSecurityModelObj;

  @override
  List<Object?> get props => [
        passwordController,
        newpasswordController,
        profileSecurityModelObj,
      ];
  ProfileSecurityState copyWith({
    TextEditingController? passwordController,
    TextEditingController? newpasswordController,
    ProfileSecurityModel? profileSecurityModelObj,
  }) {
    return ProfileSecurityState(
      passwordController: passwordController ?? this.passwordController,
      newpasswordController:
          newpasswordController ?? this.newpasswordController,
      profileSecurityModelObj:
          profileSecurityModelObj ?? this.profileSecurityModelObj,
    );
  }
}
