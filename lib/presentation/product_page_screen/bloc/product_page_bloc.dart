import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/slider_item_model.dart';import 'package:kiamis_app/presentation/product_page_screen/models/product_page_model.dart';part 'product_page_event.dart';part 'product_page_state.dart';/// A bloc that manages the state of a ProductPage according to the event that is dispatched to it.
class ProductPageBloc extends Bloc<ProductPageEvent, ProductPageState> {ProductPageBloc(ProductPageState initialState) : super(initialState) { on<ProductPageInitialEvent>(_onInitialize); }

List<SliderItemModel> fillSliderItemList() { return List.generate(1, (index) => SliderItemModel()); } 
_onInitialize(ProductPageInitialEvent event, Emitter<ProductPageState> emit, ) async  { emit(state.copyWith(sliderIndex: 0)); emit(state.copyWith(productPageModelObj: state.productPageModelObj?.copyWith(sliderItemList: fillSliderItemList()))); } 
 }
