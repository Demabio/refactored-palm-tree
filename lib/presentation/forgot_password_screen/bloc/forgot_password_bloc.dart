import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/repository/repository.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/forgot_password_screen/models/forgot_password_model.dart';
part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

/// A bloc that manages the state of a ForgotPassword according to the event that is dispatched to it.
class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  ForgotPasswordBloc(ForgotPasswordState initialState) : super(initialState) {
    on<ForgotPasswordInitialEvent>(_onInitialize);
    on<CreateLoginEvent>(_resetPassword);
  }
  final _repository = Repository();

  _onInitialize(
    ForgotPasswordInitialEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(state.copyWith(userNameController: TextEditingController()));
  }

  FutureOr<void> _resetPassword(
    CreateLoginEvent event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    await _repository.resetPassword(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: {
        'Username': state.userNameController!.text,
      },
    ).then((value) async {
      if (value.statusCode == 200)
        PrefUtils().setUsername(
          state.userNameController!.text,
        );

      value.statusCode == 200
          ? event.onCreateLoginEventSuccess?.call()
          : event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      event.onCreateLoginEventError?.call();
    });
  }
}
