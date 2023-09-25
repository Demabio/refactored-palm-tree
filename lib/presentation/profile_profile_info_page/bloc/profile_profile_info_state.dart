// ignore_for_file: must_be_immutable

part of 'profile_profile_info_bloc.dart';

/// Represents the state of ProfileProfileInfo in the application.
class ProfileProfileInfoState extends Equatable {
  ProfileProfileInfoState({this.profileProfileInfoModelObj});

  ProfileProfileInfoModel? profileProfileInfoModelObj;

  @override
  List<Object?> get props => [
        profileProfileInfoModelObj,
      ];
  ProfileProfileInfoState copyWith(
      {ProfileProfileInfoModel? profileProfileInfoModelObj}) {
    return ProfileProfileInfoState(
      profileProfileInfoModelObj:
          profileProfileInfoModelObj ?? this.profileProfileInfoModelObj,
    );
  }
}
