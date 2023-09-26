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
import 'package:path/path.dart';
part 'login_event.dart';
part 'login_state.dart';

/// A bloc that manages the state of a Login according to the event that is dispatched to it.
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState) {
    on<LoginInitialEvent>(_onInitialize);
    on<ChangePasswordVisibilityEvent>(_changePasswordVisibility);
    on<ChangeCheckBoxEvent>(_changeCheckBox);
    on<CreateLoginEvent>(_callServicePost);
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
  // FutureOr<void> _callLoginUserServicePost(
  //   CreateLoginEvent event,
  //   Emitter<LoginState> emit,
  // ) async {
  //   var postLoginUserServicePostReq = PostLoginUserServicePostReq(
  //     username: state.userNameController?.text ?? '',
  //     password: state.passwordController?.text ?? '',
  //     status: User.na,
  //     salt: User.na,
  //   );
  //   await _repository.loginUserServicePost(
  //     headers: {
  //       'Content-type': 'application/json',
  //       //'Authorization': 'Bearer ${PrefUtils().getToken()}'
  //     },
  //     requestData: postLoginUserServicePostReq.toJson(),
  //   ).then((value) async {
  //     postLoginUserServicePostResp = value;
  //     _onLoginUserServicePostSuccess(value, emit);
  //     event.onCreateLoginEventSuccess?.call();
  //   }).onError((error, stackTrace) {
  //     //implement error call
  //     _onLoginUserServicePostError();
  //     event.onCreateLoginEventError?.call();
  //   });
  // }

  // void _onLoginUserServicePostSuccess(
  //   PostLoginUserServicePostResp resp,
  //   Emitter<LoginState> emit,
  // ) {
  //   PrefUtils().setToken(resp.token ?? '');
  //   emit(
  //     state.copyWith(
  //       loginModelObj: state.loginModelObj?.copyWith(),
  //     ),
  //   );
  // }

  void _onLoginUserServicePostError() {
    //implement error method body...
  }

  FutureOr<void> _callServicePost(
    CreateLoginEvent event,
    Emitter<LoginState> emit,
  ) async {
    const String getBooksQuery = r'''
  query{
    getallCropsDapper{
        commonCrop
        crop
        cropCatId
        cropCode
        cropId
        createdBy
        dateCreated
    }
  }
''';
    _dbutils.deleteDatabaseIfExists(
        join(PrefUtils().getDBPath(), 'localdevice.db'));
    await _repository.setupServicePost(
      headers: {
        'Content-type': 'application/json',
        // 'Authorization': 'Bearer ${PrefUtils().getToken()}'
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoia2pvaG4iLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9lbWFpbGFkZHJlc3MiOiJrb3Jpb2pvaG5AZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI0OTgyIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiMSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL21vYmlsZXBob25lIjoiMDcxMjgzNDkxMSIsIklETm8iOiIxMTIzOTkwOSIsIm1vYmlsZXBob25lIjoiMDcxMjgzNDkxMSIsIlVzZXJuYW1lIjoiUm9sZSIsIm5hbWVpZGVudGlmaWVyIjoiNDk4MiIsInJvbGVJRCI6IjEiLCJSb2xlTmFtZSI6IkRlZmF1bHRSb2xlIiwiZnVsbE5hbWUiOiJram9obiIsImVtYWlsIjoia29yaW9qb2huQGdtYWlsLmNvbSIsImV4cCI6MTY5NTc0NDM5NSwiaXNzIjoia2lhbWlzLmNvbSIsImF1ZCI6IlB1YmxpYyJ9.arY7uNA4PNuoRZI8VdaCzw4ciEEWk5GSShrqXZ3fiJQ'
      },
      requestData: getBooksQuery,
    ).then((value) async {
      //postLoginUserServicePostResp = value;
      List<Crop> crops = Crop.fromJsonList(value.data);
      Future<int> cropsuccess = CropDB().insertCrops(crops);

      cropsuccess.then((_) {
        Future<List<Crop>> crops2 = CropDB().fetchAll();
        crops2.then((cropsList) {
          // Now you can work with the fetched cropsList
        });
      });
      _onsetupServicePostSuccess(value, emit);
      event.onCreateLoginEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onLoginUserServicePostError();
      event.onCreateLoginEventError?.call();
    });

    print("a");
  }

  void _onsetupServicePostSuccess(
    Response resp,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        loginModelObj: state.loginModelObj?.copyWith(),
      ),
    );
  }

  void _onsetupServicePostError() {
    //implement error method body...
  }
}
