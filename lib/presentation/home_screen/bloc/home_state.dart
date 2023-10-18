// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.searchController1,
    this.homeModelObj,
    this.bardata,
  });

  TextEditingController? searchController;

  TextEditingController? searchController1;

  HomeModel? homeModelObj;
  List<Map<String, Object?>>? bardata;
  @override
  List<Object?> get props => [
        searchController,
        searchController1,
        homeModelObj,
        bardata,
      ];
  HomeState copyWith({
    TextEditingController? searchController,
    TextEditingController? searchController1,
    HomeModel? homeModelObj,
    List<Map<String, Object?>>? bardata,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      searchController1: searchController1 ?? this.searchController1,
      homeModelObj: homeModelObj ?? this.homeModelObj,
      bardata: bardata ?? this.bardata,
    );
  }
}
