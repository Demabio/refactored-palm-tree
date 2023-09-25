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
}