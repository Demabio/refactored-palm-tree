import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/repository/repository.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/settings_screen/models/settings_model.dart';
part 'settings_event.dart';
part 'settings_state.dart';

/// A bloc that manages the state of a Settings according to the event that is dispatched to it.
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(SettingsState initialState) : super(initialState) {
    on<SettingsInitialEvent>(_onInitialize);
    on<ChangeSwitchEvent>(_changeSwitch);
    on<ResetPEvent>(_resetPassword);
  }
  final _repository = Repository();

  _changeSwitch(
    ChangeSwitchEvent event,
    Emitter<SettingsState> emit,
  ) {
    emit(state.copyWith(isSelectedSwitch: event.value));
  }

  _onInitialize(
    SettingsInitialEvent event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(isSelectedSwitch: false));
  }

  FutureOr<void> _resetPassword(
    ResetPEvent event,
    Emitter<SettingsState> emit,
  ) async {
    if (PrefUtils().getYesNo()) {
      await _repository.resetPassword(
        headers: {
          'Content-type': 'application/json',
        },
        requestData: {
          'Username': PrefUtils().getUsername(),
        },
      ).then((value) async {
        if (value.statusCode == 200)
          value.statusCode == 200
              ? event.onCreateLoginEventSuccess?.call()
              : event.onCreateLoginEventSuccess?.call();
      }).onError((error, stackTrace) {
        event.onCreateLoginEventError?.call();
      });
    } else {
      event.onFalse?.call();
    }
  }
}
