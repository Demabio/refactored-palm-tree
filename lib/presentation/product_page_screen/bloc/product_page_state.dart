// ignore_for_file: must_be_immutable

part of 'product_page_bloc.dart';

/// Represents the state of ProductPage in the application.
class ProductPageState extends Equatable {
  ProductPageState({
    this.sliderIndex = 0,
    this.productPageModelObj,
  });

  ProductPageModel? productPageModelObj;

  int sliderIndex;

  @override
  List<Object?> get props => [
        sliderIndex,
        productPageModelObj,
      ];
  ProductPageState copyWith({
    int? sliderIndex,
    ProductPageModel? productPageModelObj,
  }) {
    return ProductPageState(
      sliderIndex: sliderIndex ?? this.sliderIndex,
      productPageModelObj: productPageModelObj ?? this.productPageModelObj,
    );
  }
}
