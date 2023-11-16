class PostLoginUserServicePostResp {
  String? token;
  bool? changePassword;
  int? statusCode;

  PostLoginUserServicePostResp({
    this.token,
    this.changePassword,
    this.statusCode,
  });

  PostLoginUserServicePostResp.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    changePassword = json['changepassword'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token;
    }
    if (changePassword != null) {
      data['changepassword'] = changePassword;
    }
    if (statusCode != null) {
      data['statusCode'] = statusCode;
    }
    return data;
  }
}
