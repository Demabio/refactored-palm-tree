// ignore_for_file: must_be_immutable

part of 'home_farmer_not_found_bloc.dart';

/// Represents the state of HomeFarmerNotFound in the application.
class HomeFarmerNotFoundState extends Equatable {
  HomeFarmerNotFoundState({
    this.homeFarmerNotFoundModelObj,
    this.count = 0,
  });

  HomeFarmerNotFoundModel? homeFarmerNotFoundModelObj;

  int count;

  @override
  List<Object?> get props => [homeFarmerNotFoundModelObj, count];
  HomeFarmerNotFoundState copyWith({
    HomeFarmerNotFoundModel? homeFarmerNotFoundModelObj,
    int? count,
  }) {
    return HomeFarmerNotFoundState(
      homeFarmerNotFoundModelObj:
          homeFarmerNotFoundModelObj ?? this.homeFarmerNotFoundModelObj,
      count: count ?? this.count,
    );
  }
}
