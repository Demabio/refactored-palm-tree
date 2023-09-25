import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/login1_screen/models/login1_model.dart';
part 'login1_event.dart';
part 'login1_state.dart';

/// A bloc that manages the state of a Login1 according to the event that is dispatched to it.
class Login1Bloc extends Bloc<Login1Event, Login1State> {
  Login1Bloc(Login1State initialState) : super(initialState) {
    on<Login1InitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<Login1State> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<Login1State> emit,
  ) {
    emit(state.copyWith(
      englishName: event.value,
    ));
  }

  _onInitialize(
    Login1InitialEvent event,
    Emitter<Login1State> emit,
  ) async {
    emit(state.copyWith(
      userNameController: TextEditingController(),
      passwordController: TextEditingController(),
      isShowPassword: true,
      englishName: false,
    ));
  }
}
