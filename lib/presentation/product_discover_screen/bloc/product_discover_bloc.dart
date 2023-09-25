import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/productdetails1_item_model.dart';import 'package:kiamis_app/presentation/product_discover_screen/models/product_discover_model.dart';part 'product_discover_event.dart';part 'product_discover_state.dart';/// A bloc that manages the state of a ProductDiscover according to the event that is dispatched to it.
class ProductDiscoverBloc extends Bloc<ProductDiscoverEvent, ProductDiscoverState> {ProductDiscoverBloc(ProductDiscoverState initialState) : super(initialState) { on<ProductDiscoverInitialEvent>(_onInitialize); }

_onInitialize(ProductDiscoverInitialEvent event, Emitter<ProductDiscoverState> emit, ) async  { emit(state.copyWith(productDiscoverModelObj: state.productDiscoverModelObj?.copyWith(productdetails1ItemList: fillProductdetails1ItemList()))); } 
List<Productdetails1ItemModel> fillProductdetails1ItemList() { return List.generate(4, (index) => Productdetails1ItemModel()); } 
 }
