import 'dart:convert';

import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:dio/dio.dart';
import 'package:kiamis_app/core/app_export.dart';
import 'package:kiamis_app/core/utils/progress_dialog_utils.dart';
import 'package:kiamis_app/data/models/VersionDataPost/apk_resp.dart';
import 'package:kiamis_app/data/models/loginUserServicePost/post_login_user_service_post_resp.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

import 'network_interceptor.dart';
import 'package:path/path.dart';

class ApiClient {
  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  var url = "https://kiamistrainapi.kalro.org";

  static final ApiClient _apiClient = ApiClient._internal();

  final _dio = Dio(BaseOptions(
    connectTimeout: const Duration(seconds: 360),
  ))
    ..interceptors.add(NetworkInterceptor());

  ///method can be used for checking internet connection
  ///returns [bool] based on availability of internet
  Future isNetworkConnected() async {
    if (!await NetworkInfo().isConnected()) {
      throw NoInternetException('No Internet Found!');
    }
  }

  /// is `true` when the response status code is between 200 and 299
  ///
  /// user can modify this method with custom logics based on their API response
  bool _isSuccessCall(Response response) {
    if (response.statusCode != null) {
      return response.statusCode! >= 200 && response.statusCode! <= 299;
    }
    return false;
  }

  Future<Response> uploadSQLiteDB() async {
    final claims = JWT.decode(PrefUtils().getToken());

    String userId = claims.payload[
        'http://schemas.xmlsoap.org/ws/2005/05/identity/claims/nameidentifier'];
    String name = 'enumerator-$userId.db';
    final path = await getDatabasesPath();
    PrefUtils().setDBPath(path);
    String dbpath = join(path, name);
    // Read the SQLite DB file contents into a buffer
    final fileBytes = await File(dbpath).readAsBytes();

    // Create a FormData object to contain the file bytes
    final formData = FormData.fromMap({
      'File': MultipartFile.fromBytes(fileBytes, filename: 'localdevice.db'),
    });
    String token = PrefUtils().getToken();
    // Send a POST request to the server to upload the file
    ProgressDialogUtils.showProgressDialog();

    final response = await _dio.post(
      '$url/gateway/Farmerregistration/Upload',
      data: formData,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          // Add other headers if needed
        },
      ),
    );
    ProgressDialogUtils.hideProgressDialog();

    // Check the response status code
    if (response.statusCode != 200) {
      throw Exception(
          'Failed to upload SQLite DB file: ${response.statusCode}');
    }

    // Return the URL of the uploaded file on the server
    return response;
  }

  Future<Response> setupServicePost({
    Map<String, String> headers = const {},
    String requestData = "",
  }) async {
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/gateway/Setupservice/graphql',
        data: jsonEncode(<String, String>{'query': requestData}),
        options: Options(headers: headers),
      );
      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null
            ? PostLoginUserServicePostResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> downloadRequest({
    Map<String, String> headers = const {},
    String requestData = "",
  }) async {
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/gateway/FarmerRegistration/downloadrequest',
        options: Options(headers: headers),
      );
      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null
            ? PostLoginUserServicePostResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  /// Performs API call for https://kiamistrainapi.kalro.org/gateway/UserService/login
  ///
  /// Sends a POST request to the server's 'https://kiamistrainapi.kalro.org/gateway/UserService/login' endpoint
  /// with the provided headers and request data
  /// Returns a [PostLoginUserServicePostResp] object representing the response.
  /// Throws an error if the request fails or an exception occurs.
  Future<PostLoginUserServicePostResp> loginUserServicePost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.post(
        '$url/gateway/UserService/MobileLogin',
        data: requestData,
        options: Options(headers: headers),
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        PostLoginUserServicePostResp postLoginUserServicePostResp =
            PostLoginUserServicePostResp.fromJson(response.data);
        PostLoginUserServicePostResp postLoginUserServicePostResp2 =
            PostLoginUserServicePostResp(
          statusCode: response.statusCode,
          token: postLoginUserServicePostResp.token,
          changePassword: postLoginUserServicePostResp.changePassword,
        );

        return postLoginUserServicePostResp2;
      } else {
        throw response.data != null
            ? PostLoginUserServicePostResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (error, stackTrace) {
      print(error.response?.statusCode);

      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      PostLoginUserServicePostResp postLoginUserServicePostResp =
          PostLoginUserServicePostResp(
              statusCode: error.response?.statusCode ?? 500);

      return postLoginUserServicePostResp;
    } on NoInternetException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      PostLoginUserServicePostResp postLoginUserServicePostResp =
          PostLoginUserServicePostResp(
        statusCode: 000,
      );

      return postLoginUserServicePostResp;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> sendotp({
    Map<String, String> headers = const {},
    Map<String, dynamic> requestData =
        const {}, // Use dynamic type for request data
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      Response response = await _dio.post(
        // Change _dio.get to _dio.post
        '$url/gateway/UserService/SendOTP',
        options: Options(headers: headers), data: json.encode(requestData),
      );

      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null ? response : 'Something Went Wrong!';
      }
    } on DioException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return error.response!;
    } on NoInternetException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return Response(
        statusCode: 000,
        requestOptions: RequestOptions(path: ''),
      );
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> confirmOTP({
    Map<String, String> headers = const {},
    Map<String, dynamic> requestData =
        const {}, // Use dynamic type for request data
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      Response response = await _dio.post(
        // Change _dio.get to _dio.post
        '$url/gateway/UserService/ConfirmOTP',
        options: Options(headers: headers), data: json.encode(requestData),
      );

      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null ? response : 'Something Went Wrong!';
      }
    } on DioException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return error.response!;
    } on NoInternetException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return Response(
        statusCode: 000,
        requestOptions: RequestOptions(path: ''),
      );
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> resetPassword({
    Map<String, String> headers = const {},
    Map<String, dynamic> requestData =
        const {}, // Use dynamic type for request data
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      Response response = await _dio.post(
        // Change _dio.get to _dio.post
        '$url/gateway/UserService/ResetPassword',
        options: Options(headers: headers), data: json.encode(requestData),
      );

      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null ? response : 'Something Went Wrong!';
      }
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<Response> changePassword({
    Map<String, String> headers = const {},
    Map<String, dynamic> requestData =
        const {}, // Use dynamic type for request data
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();

      Response response = await _dio.post(
        // Change _dio.get to _dio.post
        '$url/gateway/UserService/ChangePassword',
        options: Options(headers: headers), data: json.encode(requestData),
      );

      ProgressDialogUtils.hideProgressDialog();

      if (_isSuccessCall(response)) {
        return response;
      } else {
        throw response.data != null ? response : 'Something Went Wrong!';
      }
    } on DioException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return error.response!;
    } on NoInternetException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      return Response(
        statusCode: 000,
        requestOptions: RequestOptions(path: ''),
      );
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<VersiontResp> versionPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    ProgressDialogUtils.showProgressDialog();
    try {
      await isNetworkConnected();
      var response = await _dio.get(
        '$url/gateway/UserService/GetApkVersion',
      );
      ProgressDialogUtils.hideProgressDialog();
      if (_isSuccessCall(response)) {
        VersiontResp versiontResp = VersiontResp.fromJson(response.data);
        versiontResp.statusCode = response.statusCode;
        return versiontResp;
      } else {
        throw response.data != null
            ? PostLoginUserServicePostResp.fromJson(response.data)
            : 'Something Went Wrong!';
      }
    } on DioException catch (error, stackTrace) {
      print(error.response?.statusCode);

      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );

      VersiontResp postLoginUserServicePostResp =
          VersiontResp(statusCode: error.response?.statusCode ?? 500);

      return postLoginUserServicePostResp;
    } on NoInternetException catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      VersiontResp postLoginUserServicePostResp = VersiontResp(
        statusCode: 000,
      );

      return postLoginUserServicePostResp;
    } catch (error, stackTrace) {
      ProgressDialogUtils.hideProgressDialog();
      Logger.log(
        error,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }
}
