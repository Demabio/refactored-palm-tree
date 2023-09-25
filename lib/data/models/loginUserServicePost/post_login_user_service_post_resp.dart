class PostLoginUserServicePostResp {
  String? token;
  String? idToken;
  String? localId;
  String? refreshToken;
  String? expireDate;
  String? expiresIn;
  String? email;

  PostLoginUserServicePostResp(
      {this.token,
      this.idToken,
      this.localId,
      this.refreshToken,
      this.expireDate,
      this.expiresIn,
      this.email});

  PostLoginUserServicePostResp.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    idToken = json['idToken'];
    localId = json['localId'];
    refreshToken = json['refreshToken'];
    expireDate = json['expireDate'];
    expiresIn = json['expiresIn'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (token != null) {
      data['token'] = token;
    }
    if (idToken != null) {
      data['idToken'] = idToken;
    }
    if (localId != null) {
      data['localId'] = localId;
    }
    if (refreshToken != null) {
      data['refreshToken'] = refreshToken;
    }
    if (expireDate != null) {
      data['expireDate'] = expireDate;
    }
    if (expiresIn != null) {
      data['expiresIn'] = expiresIn;
    }
    if (email != null) {
      data['email'] = email;
    }
    return data;
  }
}
