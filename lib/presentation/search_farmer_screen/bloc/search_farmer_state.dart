// ignore_for_file: must_be_immutable

part of 'search_farmer_bloc.dart';

/// Represents the state of SearchFarmer in the application.
class SearchFarmerState extends Equatable {
  SearchFarmerState({
    this.searchController,
    this.searchFarmerModelObj,
  });

  TextEditingController? searchController;

  SearchFarmerModel? searchFarmerModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchFarmerModelObj,
      ];
  SearchFarmerState copyWith({
    TextEditingController? searchController,
    SearchFarmerModel? searchFarmerModelObj,
  }) {
    return SearchFarmerState(
      searchController: searchController ?? this.searchController,
      searchFarmerModelObj: searchFarmerModelObj ?? this.searchFarmerModelObj,
    );
  }
}
