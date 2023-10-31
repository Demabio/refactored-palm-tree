import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:package_info/package_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
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
    on<VersionCheckEvent>(_download);
  }

  final _repository = Repository();

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
    PrefUtils().setSaveCreds(event.value);
    emit(state.copyWith(englishName: event.value));
  }

  _onInitialize(
    LoginInitialEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      DocumentSnapshot querySnapshot = (await firestore
          .collection('apk_versions')
          .doc("Current_version")
          .get());

      if (querySnapshot.exists) {
        String latestVersionCode = querySnapshot['version_code'];
        String apkUrl = querySnapshot['apk_url'];
        // Compare the latest version code with the current app version code
        // versionCheck();
        bool vcheck = false;
        String v = packageInfo.version;
        PrefUtils().setURL(apkUrl);

        if (latestVersionCode != v) {
          vcheck = false;
          PrefUtils().setVcheck(vcheck);
        } else {
          vcheck = true;

          PrefUtils().setVcheck(vcheck);
        }
      }
    } catch (e) {
      print(e);
    }

    TextEditingController user = TextEditingController();
    TextEditingController password = TextEditingController();
    if (PrefUtils().getSaveCreds()) {
      user = TextEditingController(text: PrefUtils().getUsername());
      password = TextEditingController(text: PrefUtils().getPassword());
    }

    emit(state.copyWith(
      userNameController: user,
      passwordController: password,
      isShowPassword: true,
      englishName: PrefUtils().getSaveCreds(),
    ));
  }

  _download(
    VersionCheckEvent event,
    Emitter<LoginState> emit,
  ) async {
    try {
      emit(state.copyWith(success: true));
      String apkUrl = PrefUtils().getURL();
      bool updated = await downloadAndInstallApk(apkUrl, emit, event);
      if (updated) {
        PrefUtils().setVcheck(updated);
        event.onTrue?.call();
      } else {
        PrefUtils().setVcheck(updated);
        event.onError?.call();
      }
    } catch (e) {
      event.onError?.call();
    }
  }

  Directory getApplicationDocumentsDirectory() {
    if (Platform.isAndroid) {
      // On Android, you can get the documents directory like this.
      return Directory('/data/data/com.kiamis.app/files');
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  Future<bool> downloadAndInstallApk(
    String apkUrl,
    Emitter<LoginState> emit,
    VersionCheckEvent event,
  ) async {
    try {
      // Create a Dio instance for making HTTP requests
      final dio = Dio();
      Directory appDocDir = getApplicationDocumentsDirectory();

      var status = await Permission.storage.request();
      if (status.isGranted) {
        final response = await dio.download(
          apkUrl,
          '${appDocDir.path}/FarmerRegistrationApp.apk', // Get the local file URI to save the APK
          onReceiveProgress: (received, total) {
            // Handle progress updates if needed
            double currentval = received / total;
            int percent = (currentval * 100).toInt();
            emit(state.copyWith(
                linebarvalue: currentval, percentagedone: percent));
            // print('Received: $received out of $total');
          },
        );
        if (response.statusCode == 200) {
          File localFile = File('${appDocDir.path}/FarmerRegistrationApp.apk');

          if (await localFile.exists()) {
            // Open and install the APK file
            //await OpenFile.open(localFile.path, type: 'application/vnd.android.package-archive');
            OpenResult result = await OpenFile.open(localFile.path,
                type: 'application/vnd.android.package-archive');

            print(result);
          } else {
            return false;
          }
        } else {
          return false;
        }
      } else if (status.isPermanentlyDenied) {
        openAppSettings();
      } else if (status.isDenied) {
        event.onFalse?.call();
        openAppSettings();

        return false;
      } else {
        return false;
      }
      // Download the APK and save it to a file

      // if (response.statusCode == 200) {
      // Get the local file path for the downloaded APK

      return true;
    } catch (e) {
      // Handle any other exceptions that might occur during the download and installation
      print('Error: $e');
      return false;
    } finally {
      emit(state.copyWith(success: false));
    }
  }

  String getLocalFileUri() {
    // Get the application directory
    Directory appDocDir = getApplicationDocumentsDirectory();

    // Define the local file path for the downloaded APK
    final localFilePath = '${appDocDir.path}/temp.apk';
    return localFilePath;
    // return Uri.file(localFilePath);
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
    if (!PrefUtils().getVcheck()) {
      event.onFalse?.call();
      return;
    }
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
      if (PrefUtils().getSaveCreds()) {
        PrefUtils().setUsername(state.userNameController?.text ?? '');
        PrefUtils().setPassword(state.passwordController?.text ?? '');
      } else {
        PrefUtils().setUsername('');
        PrefUtils().setPassword('');
      }
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
