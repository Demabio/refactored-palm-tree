// ignore_for_file: must_be_immutable

part of 'home_bloc.dart';

/// Represents the state of Home in the application.
class HomeState extends Equatable {
  HomeState({
    this.searchController,
    this.searchController1,
    this.homeModelObj,
    this.bardata,
    this.a,
    this.b,
    this.c,
    this.d,
    this.e,
    this.f,
  });

  TextEditingController? searchController;

  TextEditingController? searchController1;
  int? a;
  int? b;
  int? c;
  int? d;
  int? e;
  int? f;
  HomeModel? homeModelObj;
  List<Map<String, Object?>>? bardata;
  @override
  List<Object?> get props => [
        searchController,
        searchController1,
        homeModelObj,
        bardata,
        a,
        b,
        c,
        d,
        e,
        f,
      ];
  HomeState copyWith({
    TextEditingController? searchController,
    TextEditingController? searchController1,
    HomeModel? homeModelObj,
    List<Map<String, Object?>>? bardata,
    int? a,
    int? b,
    int? c,
    int? d,
    int? e,
    int? f,
  }) {
    return HomeState(
      searchController: searchController ?? this.searchController,
      searchController1: searchController1 ?? this.searchController1,
      homeModelObj: homeModelObj ?? this.homeModelObj,
      bardata: bardata ?? this.bardata,
      a: a ?? this.a,
      b: b ?? this.b,
      c: c ?? this.c,
      d: d ?? this.d,
      e: e ?? this.e,
      f: f ?? this.f,
    );
  }
}
