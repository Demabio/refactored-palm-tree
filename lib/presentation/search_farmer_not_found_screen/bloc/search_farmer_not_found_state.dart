// ignore_for_file: must_be_immutable

part of 'search_farmer_not_found_bloc.dart';

/// Represents the state of SearchFarmerNotFound in the application.
class SearchFarmerNotFoundState extends Equatable {
  SearchFarmerNotFoundState({
    this.searchController,
    this.searchFarmerNotFoundModelObj,
  });

  TextEditingController? searchController;

  SearchFarmerNotFoundModel? searchFarmerNotFoundModelObj;

  @override
  List<Object?> get props => [
        searchController,
        searchFarmerNotFoundModelObj,
      ];
  SearchFarmerNotFoundState copyWith({
    TextEditingController? searchController,
    SearchFarmerNotFoundModel? searchFarmerNotFoundModelObj,
  }) {
    return SearchFarmerNotFoundState(
      searchController: searchController ?? this.searchController,
      searchFarmerNotFoundModelObj:
          searchFarmerNotFoundModelObj ?? this.searchFarmerNotFoundModelObj,
    );
  }
}
