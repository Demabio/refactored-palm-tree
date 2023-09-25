// ignore_for_file: must_be_immutable

part of 'home_farmer_found_bloc.dart';

/// Represents the state of HomeFarmerFound in the application.
class HomeFarmerFoundState extends Equatable {
  HomeFarmerFoundState({this.homeFarmerFoundModelObj});

  HomeFarmerFoundModel? homeFarmerFoundModelObj;

  @override
  List<Object?> get props => [
        homeFarmerFoundModelObj,
      ];
  HomeFarmerFoundState copyWith(
      {HomeFarmerFoundModel? homeFarmerFoundModelObj}) {
    return HomeFarmerFoundState(
      homeFarmerFoundModelObj:
          homeFarmerFoundModelObj ?? this.homeFarmerFoundModelObj,
    );
  }
}
