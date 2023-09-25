import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import '../models/balancehistory_item_model.dart';import 'package:kiamis_app/presentation/draft_entries_screen/models/draft_entries_model.dart';part 'draft_entries_event.dart';part 'draft_entries_state.dart';/// A bloc that manages the state of a DraftEntries according to the event that is dispatched to it.
class DraftEntriesBloc extends Bloc<DraftEntriesEvent, DraftEntriesState> {DraftEntriesBloc(DraftEntriesState initialState) : super(initialState) { on<DraftEntriesInitialEvent>(_onInitialize); }

_onInitialize(DraftEntriesInitialEvent event, Emitter<DraftEntriesState> emit, ) async  { emit(state.copyWith(draftEntriesModelObj: state.draftEntriesModelObj?.copyWith(balancehistoryItemList: fillBalancehistoryItemList()))); } 
List<BalancehistoryItemModel> fillBalancehistoryItemList() { return List.generate(7, (index) => BalancehistoryItemModel()); } 
 }
