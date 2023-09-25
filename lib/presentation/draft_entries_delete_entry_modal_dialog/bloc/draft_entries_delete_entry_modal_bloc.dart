import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/draft_entries_delete_entry_modal_dialog/models/draft_entries_delete_entry_modal_model.dart';part 'draft_entries_delete_entry_modal_event.dart';part 'draft_entries_delete_entry_modal_state.dart';/// A bloc that manages the state of a DraftEntriesDeleteEntryModal according to the event that is dispatched to it.
class DraftEntriesDeleteEntryModalBloc extends Bloc<DraftEntriesDeleteEntryModalEvent, DraftEntriesDeleteEntryModalState> {DraftEntriesDeleteEntryModalBloc(DraftEntriesDeleteEntryModalState initialState) : super(initialState) { on<DraftEntriesDeleteEntryModalInitialEvent>(_onInitialize); }

_onInitialize(DraftEntriesDeleteEntryModalInitialEvent event, Emitter<DraftEntriesDeleteEntryModalState> emit, ) async  {  } 
 }
