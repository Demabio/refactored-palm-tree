import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/cropdetails_item_model.dart';import 'package:kiamis_app/presentation/crop_agriculture_screen/models/crop_agriculture_model.dart';part 'crop_agriculture_event.dart';part 'crop_agriculture_state.dart';/// A bloc that manages the state of a CropAgriculture according to the event that is dispatched to it.
class CropAgricultureBloc extends Bloc<CropAgricultureEvent, CropAgricultureState> {CropAgricultureBloc(CropAgricultureState initialState) : super(initialState) { on<CropAgricultureInitialEvent>(_onInitialize); }

_onInitialize(CropAgricultureInitialEvent event, Emitter<CropAgricultureState> emit, ) async  { emit(state.copyWith(cropAgricultureModelObj: state.cropAgricultureModelObj?.copyWith(cropdetailsItemList: fillCropdetailsItemList()))); } 
List<CropdetailsItemModel> fillCropdetailsItemList() { return List.generate(2, (index) => CropdetailsItemModel()); } 
 }
