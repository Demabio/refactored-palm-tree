import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/userprofile1_item_model.dart';import 'package:kiamis_app/presentation/transfer_request_screen/models/transfer_request_model.dart';part 'transfer_request_event.dart';part 'transfer_request_state.dart';/// A bloc that manages the state of a TransferRequest according to the event that is dispatched to it.
class TransferRequestBloc extends Bloc<TransferRequestEvent, TransferRequestState> {TransferRequestBloc(TransferRequestState initialState) : super(initialState) { on<TransferRequestInitialEvent>(_onInitialize); }

List<Userprofile1ItemModel> fillUserprofile1ItemList() { return List.generate(5, (index) => Userprofile1ItemModel()); } 
_onInitialize(TransferRequestInitialEvent event, Emitter<TransferRequestState> emit, ) async  { emit(state.copyWith(searchController: TextEditingController())); emit(state.copyWith(transferRequestModelObj: state.transferRequestModelObj?.copyWith(userprofile1ItemList: fillUserprofile1ItemList()))); } 
 }
