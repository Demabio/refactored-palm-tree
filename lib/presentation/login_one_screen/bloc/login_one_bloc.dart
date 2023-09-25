import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/login_one_screen/models/login_one_model.dart';
part 'login_one_event.dart';
part 'login_one_state.dart';

/// A bloc that manages the state of a LoginOne according to the event that is dispatched to it.
class LoginOneBloc extends Bloc<LoginOneEvent, LoginOneState> {
  LoginOneBloc(LoginOneState initialState) : super(initialState) {
    on<LoginOneInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
  }

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginOneState> emit,
  ) {
    emit(state.copyWith(
      isShowPassword: event.value,
    ));
  }

  _onInitialize(
    LoginOneInitialEvent event,
    Emitter<LoginOneState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      isShowPassword: true,
    ));
  }
}
