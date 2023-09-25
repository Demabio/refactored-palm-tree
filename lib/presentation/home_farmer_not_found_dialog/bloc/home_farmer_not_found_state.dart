// ignore_for_file: must_be_immutable

part of 'home_farmer_not_found_bloc.dart';

/// Represents the state of HomeFarmerNotFound in the application.
class HomeFarmerNotFoundState extends Equatable {
  HomeFarmerNotFoundState({this.homeFarmerNotFoundModelObj});

  HomeFarmerNotFoundModel? homeFarmerNotFoundModelObj;

  @override
  List<Object?> get props => [
        homeFarmerNotFoundModelObj,
      ];
  HomeFarmerNotFoundState copyWith(
      {HomeFarmerNotFoundModel? homeFarmerNotFoundModelObj}) {
    return HomeFarmerNotFoundState(
      homeFarmerNotFoundModelObj:
          homeFarmerNotFoundModelObj ?? this.homeFarmerNotFoundModelObj,
    );
  }
}
