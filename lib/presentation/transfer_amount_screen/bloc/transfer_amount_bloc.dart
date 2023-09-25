import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/transfer_amount_screen/models/transfer_amount_model.dart';part 'transfer_amount_event.dart';part 'transfer_amount_state.dart';/// A bloc that manages the state of a TransferAmount according to the event that is dispatched to it.
class TransferAmountBloc extends Bloc<TransferAmountEvent, TransferAmountState> {TransferAmountBloc(TransferAmountState initialState) : super(initialState) { on<TransferAmountInitialEvent>(_onInitialize); }

_onInitialize(TransferAmountInitialEvent event, Emitter<TransferAmountState> emit, ) async  {  } 
 }
