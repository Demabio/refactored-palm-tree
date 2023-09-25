// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.searchController1,
    this.homeModelObj,
  });

  TextEditingController? searchController;

  TextEditingController? searchController1;

  HomeModel? homeModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchController1,
        homeModelObj,
      ];
  HomeState copyWith({
    TextEditingController? searchController,
    TextEditingController? searchController1,
    HomeModel? homeModelObj,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      searchController1: searchController1 ?? this.searchController1,
      homeModelObj: homeModelObj ?? this.homeModelObj,
    );
  }
}
