import 'package:equatable/equatable.dart';import 'package:flutter/material.dart';import '/core/app_export.dart';import 'package:kiamis_app/presentation/enable_linked_accounts_screen/models/enable_linked_accounts_model.dart';part 'enable_linked_accounts_event.dart';part 'enable_linked_accounts_state.dart';/// A bloc that manages the state of a EnableLinkedAccounts according to the event that is dispatched to it.
class EnableLinkedAccountsBloc extends Bloc<EnableLinkedAccountsEvent, EnableLinkedAccountsState> {EnableLinkedAccountsBloc(EnableLinkedAccountsState initialState) : super(initialState) { on<EnableLinkedAccountsInitialEvent>(_onInitialize); on<ChangeSwitchEvent>(_changeSwitch); on<ChangeSwitch1Event>(_changeSwitch1); on<ChangeSwitch2Event>(_changeSwitch2); on<ChangeSwitch3Event>(_changeSwitch3); on<ChangeSwitch4Event>(_changeSwitch4); }

_changeSwitch(ChangeSwitchEvent event, Emitter<EnableLinkedAccountsState> emit, ) { emit(state.copyWith(isSelectedSwitch: event.value)); } 
_changeSwitch1(ChangeSwitch1Event event, Emitter<EnableLinkedAccountsState> emit, ) { emit(state.copyWith(isSelectedSwitch1: event.value)); } 
_changeSwitch2(ChangeSwitch2Event event, Emitter<EnableLinkedAccountsState> emit, ) { emit(state.copyWith(isSelectedSwitch2: event.value)); } 
_changeSwitch3(ChangeSwitch3Event event, Emitter<EnableLinkedAccountsState> emit, ) { emit(state.copyWith(isSelectedSwitch3: event.value)); } 
_changeSwitch4(ChangeSwitch4Event event, Emitter<EnableLinkedAccountsState> emit, ) { emit(state.copyWith(isSelectedSwitch4: event.value)); } 
_onInitialize(EnableLinkedAccountsInitialEvent event, Emitter<EnableLinkedAccountsState> emit, ) async  { emit(state.copyWith(isSelectedSwitch: false, isSelectedSwitch1: false, isSelectedSwitch2: false, isSelectedSwitch3: false, isSelectedSwitch4: false)); } 
 }
