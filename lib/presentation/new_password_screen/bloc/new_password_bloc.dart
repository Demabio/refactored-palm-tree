import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/repository/repository.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/new_password_screen/models/new_password_model.dart';
part 'new_password_event.dart';
part 'new_password_state.dart';

/// A bloc that manages the state of a NewPassword according to the event that is dispatched to it.
class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc(NewPasswordState initialState) : super(initialState) {
    on<NewPasswordInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangePasswordVisibilityEvent1>(_changePasswordVisibility1);
    on<ChangePasswordVisibilityEvent2>(_changePasswordVisibility2);
    on<CreateLoginEvent>(_resetPassword);
  }
  final _repository = Repository();
  _changePasswordVisibility2(
    ChangePasswordVisibilityEvent2 event,
    Emitter<NewPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword2: event.value));
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<NewPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changePasswordVisibility1(
    ChangePasswordVisibilityEvent1 event,
    Emitter<NewPasswordState> emit,
  ) {
    emit(state.copyWith(isShowPassword1: event.value));
  }

  _onInitialize(
    NewPasswordInitialEvent event,
    Emitter<NewPasswordState> emit,
  ) async {
    emit(state.copyWith(
        newpasswordController: TextEditingController(),
        confirmpasswordController: TextEditingController(),
        temporaryPassword: TextEditingController(),
        username: TextEditingController(),
        isShowPassword: true,
        isShowPassword1: true));
  }

  FutureOr<void> _resetPassword(
    CreateLoginEvent event,
    Emitter<NewPasswordState> emit,
  ) async {
    await _repository.changePassword(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: {
        'Username': state.username!.text,
        'OldPassword': state.temporaryPassword!.text,
        'NewPassword': state.newpasswordController!.text,
      },
    ).then((value) async {
      value.statusCode == 200
          ? event.onCreateLoginEventSuccess?.call()
          : event.onCreateLoginEventError?.call();
    }).onError((error, stackTrace) {
      event.onCreateLoginEventError?.call();
    });
  }
}
