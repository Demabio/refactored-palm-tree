import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/draft_entries_clear_drafts_modal_dialog/models/draft_entries_clear_drafts_modal_model.dart';part 'draft_entries_clear_drafts_modal_event.dart';part 'draft_entries_clear_drafts_modal_state.dart';/// A bloc that manages the state of a DraftEntriesClearDraftsModal according to the event that is dispatched to it.
class DraftEntriesClearDraftsModalBloc extends Bloc<DraftEntriesClearDraftsModalEvent, DraftEntriesClearDraftsModalState> {DraftEntriesClearDraftsModalBloc(DraftEntriesClearDraftsModalState initialState) : super(initialState) { on<DraftEntriesClearDraftsModalInitialEvent>(_onInitialize); }

_onInitialize(DraftEntriesClearDraftsModalInitialEvent event, Emitter<DraftEntriesClearDraftsModalState> emit, ) async  {  } 
 }
