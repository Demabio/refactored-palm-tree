// ignore_for_file: must_be_immutable

part of 'search_farmer_bloc.dart';

/// Represents the state of SearchFarmer in the application.
class SearchFarmerState extends Equatable {
  SearchFarmerState({
    this.searchController,
    this.searchFarmerModelObj,
    this.farm,
    this.fmodel = const [],
    this.name,
  });

  FarmerFarm? farm;

  TextEditingController? searchController;
  String? name;
  SearchFarmerModel? searchFarmerModelObj;
  List<FdetailsItemModel> fmodel;

  @override
  List<Object?> get props =>
      [searchController, searchFarmerModelObj, farm, fmodel];
  SearchFarmerState copyWith({
    TextEditingController? searchController,
    SearchFarmerModel? searchFarmerModelObj,
    FarmerFarm? farm,
    List<FdetailsItemModel>? fmodel,
    String? name,
  }) {
    return SearchFarmerState(
      searchController: searchController ?? this.searchController,
      searchFarmerModelObj: searchFarmerModelObj ?? this.searchFarmerModelObj,
      farm: farm ?? this.farm,
      fmodel: fmodel ?? this.fmodel,
      name: name ?? this.name,
    );
  }
}
