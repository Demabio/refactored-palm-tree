// ignore_for_file: must_be_immutable

part of 'search_farmer_found_bloc.dart';

/// Represents the state of SearchFarmerFound in the application.
class SearchFarmerFoundState extends Equatable {
  SearchFarmerFoundState({
    this.searchController,
    this.searchFarmerFoundModelObj,
  });

  TextEditingController? searchController;

  SearchFarmerFoundModel? searchFarmerFoundModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchFarmerFoundModelObj,
      ];
  SearchFarmerFoundState copyWith({
    TextEditingController? searchController,
    SearchFarmerFoundModel? searchFarmerFoundModelObj,
  }) {
    return SearchFarmerFoundState(
      searchController: searchController ?? this.searchController,
      searchFarmerFoundModelObj:
          searchFarmerFoundModelObj ?? this.searchFarmerFoundModelObj,
    );
  }
}
