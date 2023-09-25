// ignore_for_file: must_be_immutable

part of 'product_search_bloc.dart';

/// Represents the state of ProductSearch in the application.
class ProductSearchState extends Equatable {
  ProductSearchState({
    this.searchoneController,
    this.productSearchModelObj,
  });

  TextEditingController? searchoneController;

  ProductSearchModel? productSearchModelObj;

  @override
  List<Object?> get props => [
        searchoneController,
        productSearchModelObj,
      ];
  ProductSearchState copyWith({
    TextEditingController? searchoneController,
    ProductSearchModel? productSearchModelObj,
  }) {
    return ProductSearchState(
      searchoneController: searchoneController ?? this.searchoneController,
      productSearchModelObj:
          productSearchModelObj ?? this.productSearchModelObj,
    );
  }
}
