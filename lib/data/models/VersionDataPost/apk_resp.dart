class VersiontResp {
  String? url;
  String? version;
  int? statusCode;

  VersiontResp({
    this.url,
    this.version,
    this.statusCode,
  });

  VersiontResp.fromJson(Map<String, dynamic> json) {
    url = json['url'] as String?;
    version = json['version'] as String?;
    statusCode = json['statusCode'] as int?;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['version'] = version;
    return data;
  }
}
