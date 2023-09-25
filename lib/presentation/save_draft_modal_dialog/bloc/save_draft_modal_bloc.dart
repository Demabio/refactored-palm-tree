import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/save_draft_modal_dialog/models/save_draft_modal_model.dart';part 'save_draft_modal_event.dart';part 'save_draft_modal_state.dart';/// A bloc that manages the state of a SaveDraftModal according to the event that is dispatched to it.
class SaveDraftModalBloc extends Bloc<SaveDraftModalEvent, SaveDraftModalState> {SaveDraftModalBloc(SaveDraftModalState initialState) : super(initialState) { on<SaveDraftModalInitialEvent>(_onInitialize); }

_onInitialize(SaveDraftModalInitialEvent event, Emitter<SaveDraftModalState> emit, ) async  {  } 
 }
