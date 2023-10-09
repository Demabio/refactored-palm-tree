import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:kiamis_app/data/sqlService/dbqueries/crops/crop.dart';
import '../../../data/models/dbModels/crops/crop.dart';
import '../../../data/sqlService/dbutils.dart';
import '/core/app_export.dart';
import 'package:kiamis_app/presentation/login_screen/models/login_model.dart';
import 'package:kiamis_app/data/models/loginUserServicePost/post_login_user_service_post_resp.dart';
import 'package:kiamis_app/data/models/loginUserServicePost/post_login_user_service_post_req.dart';
import 'dart:async';
import 'package:kiamis_app/data/repository/repository.dart';
import 'package:kiamis_app/core/constants/user.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<CreateLoginEvent>(_callLoginUserServicePost);
  }

  final _repository = Repository();
  final _dbutils = DBUtils();

  var postLoginUserServicePostResp = PostLoginUserServicePostResp();

  _changePasswordVisibility(
    ChangePasswordVisibilityEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(isShowPassword: event.value));
  }

  _changeCheckBox(
    ChangeCheckBoxEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(state.copyWith(englishName: event.value));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    PrefUtils().setFarmerId(0);
    emit(state.copyWith(
        userNameController: TextEditingController(),
        passwordController: TextEditingController(),
        isShowPassword: true,
        englishName: false));
  }

  /// Calls [https://prudmatvisionaries.com/gateway/UserService/login] with the provided event and emits the state.
  ///
  /// The [CreateLoginEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callLoginUserServicePost(
    CreateLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    var postLoginUserServicePostReq = PostLoginUserServicePostReq(
      username: state.userNameController?.text ?? '',
      password: state.passwordController?.text ?? '',
      status: User.na,
      salt: User.na,
    );
    await _repository.loginUserServicePost(
      headers: {
        'Content-type': 'application/json',
        //'Authorization': 'Bearer ${PrefUtils().getToken()}'
      },
      requestData: postLoginUserServicePostReq.toJson(),
    ).then((value) async {
      postLoginUserServicePostResp = value;
      _onLoginUserServicePostSuccess(value, emit);
      event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onLoginUserServicePostError();
      event.onCreateLoginEventError?.call();
    });
  }

  void _onLoginUserServicePostSuccess(
    PostLoginUserServicePostResp resp,
    Emitter<LoginState> emit,
  ) {
    PrefUtils().setToken(resp.token ?? '');
    emit(
      state.copyWith(
        loginModelObj: state.loginModelObj?.copyWith(),
      ),
    );
  }

  void _onLoginUserServicePostError() {
    //implement error method body...
  }

//
}
