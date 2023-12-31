import 'package:dio/dio.dart';
import 'package:kiamis_app/data/models/VersionDataPost/apk_resp.dart';
import 'package:kiamis_app/data/models/loginUserServicePost/post_login_user_service_post_resp.dart';

import '../apiClient/api_client.dart';

/// Repository class for managing API requests.
///
/// This class provides a simplified interface for making the
/// API request using the [ApiClient] instance
class Repository {
  final _apiClient = ApiClient();

  Future<PostLoginUserServicePostResp> loginUserServicePost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.loginUserServicePost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<VersiontResp> versionPost({
    Map<String, String> headers = const {},
    Map requestData = const {},
  }) async {
    return await _apiClient.versionPost(
      headers: headers,
    );
  }

  Future<Response> sendotp(
      {Map<String, String> headers = const {},
      Map<String, String> requestData = const {}}) async {
    return await _apiClient.sendotp(headers: headers, requestData: requestData);
  }

  Future<Response> resetPassword(
      {Map<String, String> headers = const {},
      Map<String, String> requestData = const {}}) async {
    return await _apiClient.resetPassword(
        headers: headers, requestData: requestData);
  }

  Future<Response> confirmOTP(
      {Map<String, String> headers = const {},
      Map<String, String> requestData = const {}}) async {
    return await _apiClient.confirmOTP(
        headers: headers, requestData: requestData);
  }

  Future<Response> changePassword(
      {Map<String, String> headers = const {},
      Map<String, String> requestData = const {}}) async {
    return await _apiClient.changePassword(
        headers: headers, requestData: requestData);
  }

  Future<Response> postPost() async {
    return await _apiClient.uploadSQLiteDB();
  }

  Future<Response> setupServicePost({
    Map<String, String> headers = const {},
    String requestData = "",
  }) async {
    return await _apiClient.setupServicePost(
      headers: headers,
      requestData: requestData,
    );
  }

  Future<Response> downloadRequest({
    Map<String, String> headers = const {},
    String requestData = "",
  }) async {
    return await _apiClient.downloadRequest(
      headers: headers,
      requestData: requestData,
    );
  }
}
