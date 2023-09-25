import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/recover_account_screen/models/recover_account_model.dart';
part 'recover_account_event.dart';
part 'recover_account_state.dart';

/// A bloc that manages the state of a RecoverAccount according to the event that is dispatched to it.
class RecoverAccountBloc
    extends Bloc<RecoverAccountEvent, RecoverAccountState> {
  RecoverAccountBloc(RecoverAccountState initialState) : super(initialState) {
    on<RecoverAccountInitialEvent>(_onInitialize);
  }

  _onInitialize(
    RecoverAccountInitialEvent event,
    Emitter<RecoverAccountState> emit,
  ) async {
    emit(state.copyWith(userNameController: TextEditingController()));
  }
}
