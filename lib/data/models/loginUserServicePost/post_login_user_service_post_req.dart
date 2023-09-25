class PostLoginUserServicePostReq {
  String? username;
  String? password;
  String? status;
  String? salt;

  PostLoginUserServicePostReq(
      {this.username, this.password, this.status, this.salt});

  PostLoginUserServicePostReq.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['Password'];
    status = json['status'];
    salt = json['salt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (username != null) {
      data['username'] = username;
    }
    if (password != null) {
      data['Password'] = password;
    }
    if (status != null) {
      data['status'] = status;
    }
    if (salt != null) {
      data['salt'] = salt;
    }
    return data;
  }
}
