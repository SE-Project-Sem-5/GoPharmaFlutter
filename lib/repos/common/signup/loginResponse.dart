class LoginResponse {
  String type;
  String msg;
  Data data;

  LoginResponse({
    this.type,
    this.msg,
    this.data,
  });

  LoginResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String twoFactorAuth;

  Data({
    this.twoFactorAuth,
  });

  Data.fromJson(Map<String, dynamic> json) {
    twoFactorAuth =
        json['twoFactorAuth'] != null ? json['twoFactorAuth'] : "none";
  }
}
